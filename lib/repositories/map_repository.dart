import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:distance/distance.dart' as d;
import 'package:flutter/painting.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart';
import 'package:polyline/polyline.dart';
import 'package:snap_path/models/elevation_data.dart';

/// Utility functions for maps
class MapUtils {
  /// Convert the given polyline string to a list of latlng coordinates
  static List<LatLng> polylineToCoordinates(String polyline) {
    List<List<double>> rawCoordinates = Polyline.Decode(encodedString: polyline).decodedCoords;

    return rawCoordinates.map((coord) => LatLng(coord[0], coord[1])).toList();
  }
}

abstract class MapRepository {
  /// Get the elevation data along the given path
  Future<ElevationData> getElevation(List<LatLng> path);

  /// Match the given path to nearby roads and trails, returning the matched path
  Future<List<LatLng>> matchPath(List<LatLng> path);
}

class MapboxRepository implements MapRepository {
  final Client _httpClient;
  final String apiKey;

  MapboxRepository({Client client, this.apiKey}) : _httpClient = client?? Client();

  @override
  Future<List<LatLng>> matchPath(List<LatLng> path) async {
    List<LatLng> matched = path;
    if (path.length > 2) {
      var splitCoords = path.fold<List<List<LatLng>>>([], (parts, coord) {
        if (parts.isEmpty || parts.last.length >= 100) {
          parts.add([coord]);
        } else {
          parts.last.add(coord);
        }
        return parts;
      });

      var matchedCoords = await Future.wait(splitCoords.map((coords) async {
        var coordsString = coords.map((l) => '${l.longitude},${l.latitude}').join(';');
        var response = await _httpClient.get(
          'https://api.mapbox.com/matching/v5/mapbox/walking/$coordsString'
          '?access_token=$apiKey'
          '&radiuses=${List.filled(coords.length, 50).join(';')}');

        if (response.statusCode == 200) {
          var decoded = json.decode(response.body) as Map<String, dynamic>;
          if (decoded['code'] == 'Ok') {
            return MapUtils.polylineToCoordinates(decoded['matchings'][0]['geometry']);
          }
        }
        return coords;
      }));

      matched = matchedCoords.reduce((value, element) => value..addAll(element));
    } else if (path.length == 2) {
      var coordsString = path.map((l) => '${l.longitude},${l.latitude}').join(';');
      var response = await _httpClient.get(
        'https://api.mapbox.com/directions/v5/mapbox/walking/$coordsString'
        '?access_token=$apiKey'
        '&radiuses=unlimited;unlimited');

      if (response.statusCode == 200) {
        var decoded = json.decode(response.body) as Map<String, dynamic>;
        if (decoded['code'] == 'Ok') {
          matched = MapUtils.polylineToCoordinates(decoded['routes'][0]['geometry']);
        }
      }
    }

    return matched;
  }

  /// Compute the containing tile for the given latitude, longitude, and zoom
  static Point<double> _latLngToTile(LatLng coord, int zoom) {
    final tileCount = pow(2, zoom);
    final xTile = tileCount * ((coord.longitude + 180) / 360);
    final yTile = tileCount * (1 - (log(tan(coord.latitudeInRad) + (1 / cos(coord.latitudeInRad))) / pi)) / 2;

    return Point(xTile, yTile);
  }

  /// Given a list of [tiles], fetch their elevation data (images) at the given [zoom]
  Future<Map<Point<int>, ByteData>> _getTileData(Iterable<Point<int>> tiles, int zoom) async {
    var tilesData = tiles.map((tile) async {
      var completer = Completer<ByteData>();
      var response = await _httpClient.get(
        'https://api.mapbox.com/v4/mapbox.terrain-rgb/$zoom/${tile.x}/${tile.y}.pngraw'
        '?access_token=$apiKey');
      
      if (response.statusCode == 200) {
        MemoryImage(response.bodyBytes)
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((info, _) async {
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
    var index = (y * 256 * 4) + x * 4;

    var r = pixels.getUint8(index);
    var g = pixels.getUint8(index + 1);
    var b = pixels.getUint8(index + 2);

    return [r, g, b];
  }

  @override
  Future<ElevationData> getElevation(List<LatLng> path) async {
    if (path.length > 0) {
      final zoomLevel = 12;
      var tileCoords = path.map((coord) => _latLngToTile(coord, zoomLevel)).toList();
      var allTiles = tileCoords.fold<Set<Point<int>>>(Set<Point<int>>(), (tileSet, tile) {
        tileSet.add(Point(tile.x.floor(), tile.y.floor()));
        return tileSet;
      });
      
      var tileBytes = await _getTileData(allTiles, zoomLevel);

      List<ElevationPoint> elevations = [];
      double totalDistance = 0;
      LatLng prevCoord = path.first;
      for (var i = 0; i < path.length; i += 1) {
        var tileCoord = tileCoords[i];
        var coord = path[i];

        totalDistance += Distance().distance(coord, prevCoord);
        
        var tile = tileBytes[Point(tileCoord.x.floor(), tileCoord.y.floor())];
        if (tile != null) {
          var localX = ((tileCoord.x - tileCoord.x.floor()) * 256).floor();
          var localY = ((tileCoord.y - tileCoord.y.floor()) * 256).floor();

          var p = _getPixelAt(tile, localX, localY);

          var elevation = -10000 + ((p[0] * 256 * 256 + p[1] * 256 + p[2]) * 0.1);
          elevations.add(ElevationPoint(
            distance: d.Distance(micrometers: (totalDistance * d.Distance.micrometersInMeter).round()),
            elevation: d.Distance(micrometers: (elevation * d.Distance.micrometersInMeter).round()),
            coordinate: coord,
          ));
        }
        prevCoord = coord;
      }

      return ElevationData.from(elevations);
    } else {
      return ElevationData();
    }
  }
}
