import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:flutter_map/flutter_map.dart' show LatLngBounds;
import 'package:latlong/latlong.dart';
import 'package:http/http.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/models/search_result.dart';
import 'package:snap_path/repositories/map_repository.dart';
import 'package:snap_path/utils/map_utils.dart';
import 'package:snap_path/utils/utils.dart';

class MapboxRepository implements MapRepository {
  MapboxRepository({Client client, this.apiKey})
      : _httpClient = client ?? Client();

  final Client _httpClient;
  final String apiKey;

  @override
  Future<List<LatLng>> matchPath(List<LatLng> path) async {
    var matched = path;
    if (path.length > 2) {
      final splitCoords = path.fold<List<List<LatLng>>>([], (parts, coord) {
        if (parts.isEmpty || parts.last.length >= 100) {
          parts.add([coord]);
        } else {
          parts.last.add(coord);
        }
        return parts;
      });

      final matchedCoords = await Future.wait(splitCoords.map((coords) async {
        final coordsString =
            coords.map((l) => '${l.longitude},${l.latitude}').join(';');
        final response = await _httpClient.get(
            'https://api.mapbox.com/matching/v5/mapbox/walking/$coordsString'
            '?access_token=$apiKey'
            '&radiuses=${List.filled(coords.length, 50).join(';')}');

        if (response.statusCode == 200) {
          final decoded = json.decode(response.body) as Map<String, dynamic>;
          if (decoded['code'] == 'Ok') {
            return MapUtils.polylineToCoordinates(
                decoded['matchings'][0]['geometry']);
          }
        }
        return coords;
      }));

      matched =
          matchedCoords.reduce((value, element) => value..addAll(element));
    } else if (path.length == 2) {
      final coordsString =
          path.map((l) => '${l.longitude},${l.latitude}').join(';');
      final response = await _httpClient.get(
          'https://api.mapbox.com/directions/v5/mapbox/walking/$coordsString'
          '?access_token=$apiKey'
          '&radiuses=unlimited;unlimited');

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        if (decoded['code'] == 'Ok') {
          matched =
              MapUtils.polylineToCoordinates(decoded['routes'][0]['geometry']);
        }
      }
    }

    return matched;
  }

  /// Compute the containing tile for the given latitude, longitude, and zoom
  static Point<double> _latLngToTile(LatLng coord, int zoom) {
    final tileCount = pow(2, zoom);
    final xTile = tileCount * ((coord.longitude + 180) / 360);
    final yTile = tileCount *
        (1 -
            (log(tan(coord.latitudeInRad) + (1 / cos(coord.latitudeInRad))) /
                pi)) /
        2;

    return Point(xTile, yTile);
  }

  /// Given a list of [tiles], fetch their
  /// elevation data (images) at the given [zoom]
  Future<Map<Point<int>, ByteData>> _getTileData(
      Iterable<Point<int>> tiles, int zoom) async {
    final tilesData = tiles.map((tile) async {
      final completer = Completer<ByteData>();
      final response = await _httpClient.get(
          'https://api.mapbox.com/v4/mapbox.terrain-rgb/$zoom/${tile.x}/${tile.y}.pngraw'
          '?access_token=$apiKey');

      if (response.statusCode == 200) {
        MemoryImage(response.bodyBytes)
            .resolve(const ImageConfiguration())
            .addListener(ImageStreamListener(
              (info, _) async {
                completer.complete(await info.image.toByteData());
              },
              onError: (exception, stackTrace) => completer.complete(null),
            ));

        return completer.future;
      }

      return null;
    });

    return Map.fromIterables(tiles, await Future.wait(tilesData));
  }

  /// Compute the pixel RGB values at the given [x] and [y]
  static List<int> _getPixelAt(ByteData pixels, int x, int y) {
    final index = (y * 256 * 4) + x * 4;

    final r = pixels.getUint8(index);
    final g = pixels.getUint8(index + 1);
    final b = pixels.getUint8(index + 2);

    return [r, g, b];
  }

  @override
  Future<ElevationData> getElevation(List<LatLng> path) async {
    if (path.isNotEmpty) {
      const zoomLevel = 12;
      final tileCoords =
          path.map((coord) => _latLngToTile(coord, zoomLevel)).toList();
      final allTiles = tileCoords.fold<Set<Point<int>>>({}, (tileSet, tile) {
        tileSet.add(Point(tile.x.floor(), tile.y.floor()));
        return tileSet;
      });

      final tileBytes = await _getTileData(allTiles, zoomLevel);

      final elevations = <ElevationPoint>[];
      var totalDistance = 0.0;
      var prevCoord = path.first;
      for (var i = 0; i < path.length; i += 1) {
        final tileCoord = tileCoords[i];
        final coord = path[i];

        totalDistance += const Distance().distance(coord, prevCoord);

        final tile = tileBytes[Point(tileCoord.x.floor(), tileCoord.y.floor())];
        final localX = ((tileCoord.x - tileCoord.x.floor()) * 256).floor();
        final localY = ((tileCoord.y - tileCoord.y.floor()) * 256).floor();

        final p = tile != null ? _getPixelAt(tile, localX, localY) : [0, 0, 0];

        final elevation =
            -10000 + ((p[0] * 256 * 256 + p[1] * 256 + p[2]) * 0.1);
        elevations.add(ElevationPoint(
          distance: totalDistance.toDistance(),
          elevation: elevation.toDistance(),
          coordinate: coord,
        ));
        prevCoord = coord;
      }

      return ElevationData.from(elevations);
    } else {
      return ElevationData();
    }
  }

  @override
  Future<List<SearchResult>> search(String query,
      [LatLng currentLocation]) async {
    final results = <SearchResult>[];
    if ((query?.isNotEmpty ?? false) && query.length <= 256) {
      final sanitizedQuery = Uri.encodeComponent(query.replaceAll(';', ''));
      final proximity = currentLocation != null
          ? '&proximity=${currentLocation.longitude},'
              '${currentLocation.latitude}'
          : '';
      final response = await _httpClient.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$sanitizedQuery.json'
          '?access_token=$apiKey&limit=10$proximity');

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        final features =
            List<Map<String, dynamic>>.from(decoded['features'] as List);

        for (final feature in features) {
          var title = feature['text'] as String;
          if (feature['address'] != null &&
              feature['place_type'][0] == 'address') {
            title = '${(feature['address'] as String)} $title';
          }

          final placeContext = (feature['context'] as List) ?? [];
          var subtitle = '';

          final place = placeContext.firstWhere(
              (m) => m['id'].startsWith('place.'),
              orElse: () => {})['text'];
          final region = placeContext.firstWhere(
              (m) => m['id'].startsWith('region.'),
              orElse: () => {})['text'];
          final country = placeContext.firstWhere(
              (m) => m['id'].startsWith('country.'),
              orElse: () => {})['text'];

          if (place != null) {
            subtitle += place;

            if (region != null || country != null) {
              subtitle += ', ';
            }
          }
          if (region != null) {
            subtitle += region;

            if (place == null && country != null) {
              subtitle += ', ';
            }
          }
          if (country != null && place == null) {
            subtitle += country;
          }

          final center = LatLng((feature['center'][1] as num).toDouble(),
              (feature['center'][0] as num).toDouble());
          var bounds = LatLngBounds(center);
          if (feature['bbox'] != null) {
            final topLeft = LatLng((feature['bbox'][1] as num).toDouble(),
                (feature['bbox'][0] as num).toDouble());
            final bottomRight = LatLng((feature['bbox'][3] as num).toDouble(),
                (feature['bbox'][2] as num).toDouble());
            bounds = LatLngBounds(topLeft, bottomRight);
          }

          results.add(SearchResult(title, subtitle,
              feature['place_name'] as String, center, bounds));
        }
      }
    }

    return results;
  }

  @override
  String getPreview(List<LatLng> coordinates, int width, int height) {
    if (coordinates.isNotEmpty) {
      final bounds = LatLngBounds.fromPoints(coordinates);
      bounds
        ..extend(LatLng(
            bounds.north, bounds.west - 0.2 * (bounds.east - bounds.west)))
        ..extend(LatLng(
            bounds.north, bounds.east + 0.2 * (bounds.east - bounds.west)))
        ..extend(LatLng(
            bounds.south - 0.2 * (bounds.north - bounds.south), bounds.east))
        ..extend(LatLng(
            bounds.north + 0.2 * (bounds.north - bounds.south), bounds.east));

      final framePoints = [
        bounds.northWest,
        bounds.northEast,
        bounds.southEast,
        bounds.southWest
      ];

      final polylineUrlString =
          Uri.encodeComponent(MapUtils.coordinatesToPolyline(coordinates));
      final frameUrlString =
          Uri.encodeComponent(MapUtils.coordinatesToPolyline(framePoints));

      final pathWidth = ((width + height) / 120).round();

      return 'https://api.mapbox.com/styles/v1/kjdemian/ckah637x600q21imtjexsuvdt'
          '/static/path-${pathWidth * 1.6}+fff($polylineUrlString),path-$pathWidth+4d37b0($polylineUrlString),path-0($frameUrlString)/auto/${width}x$height'
          '?access_token=$apiKey';
    }

    return '';
  }
}
