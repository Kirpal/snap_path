import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:image/image.dart';
import 'package:route/route.dart';

double _asinh(num x) => log(x + sqrt(pow(x, 2) + 1));

/// Convenience for creating a [Distance] from meters
extension on num {
  Distance toDistance() {
    final micrometers = this * Distance.micrometersInMeter;
    return Distance(micrometers: micrometers.round());
  }
}

/// {@template terrain_resource}
/// Used for interacting with the Mapbox Terrain-RGB API
///
/// https://docs.mapbox.com/help/troubleshooting/access-elevation-data/#mapbox-terrain-rgb
/// {@endtemplate}
class TerrainResource {
  /// {@macro terrain_resource}
  TerrainResource(this._httpClient, {Decoder? imageDecoder})
      : _imageDecoder = imageDecoder ?? PngDecoder();

  final Dio _httpClient;
  final Decoder _imageDecoder;
  static const _zoomLevel = 12;
  static final _tileCache = <String, Image?>{};

  /// Fetch the RGB terrain tile at the given [x], [y]
  ///
  /// Throws [HttpException] if the request fails
  Future<Image?> _getTile(int x, int y) async {
    final key = '$_zoomLevel/$x/$y';
    if (!_tileCache.containsKey(key)) {
      try {
        var response = await _httpClient.get<ResponseBody>(
          'v4/mapbox.terrain-rgb/$key.pngraw',
          options: Options(responseType: ResponseType.stream),
        );

        final bytes = await response.data?.stream
            .fold<List<int>>([], (data, piece) => [...data, ...piece]);
        final image = _imageDecoder.decodeImage(bytes ?? []);
        _tileCache[key] = image;
      } on DioError catch (e) {
        throw HttpException('get_terrain_response: ${e.response?.statusCode}');
      }
    }
    return _tileCache[key];
  }

  /// Fetch the elevation at the given coordinate
  ///
  /// Throws [HttpException] if the request fails
  Future<Distance> getElevation(LatLng coordinate) async {
    final tileCount = pow(2, _zoomLevel);
    final tileX = tileCount * ((coordinate.longitude + 180) / 360);
    final tileY =
        tileCount * (1 - _asinh(tan(coordinate.latitudeInRad)) / pi) / 2;

    final tile = await _getTile(tileX.floor(), tileY.floor());
    final pixelX = ((tileX - tileX.floor()) * 256).floor();
    final pixelY = ((tileY - tileY.floor()) * 256).floor();

    final color = tile?.getPixel(pixelX, pixelY) ?? 0;
    final r = getRed(color);
    final g = getGreen(color);
    final b = getBlue(color);

    final elevation = -10000 + ((r * 256 * 256 + g * 256 + b) * 0.1);

    return elevation.toDistance();
  }
}
