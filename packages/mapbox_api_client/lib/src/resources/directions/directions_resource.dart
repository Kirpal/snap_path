import 'dart:io';

import 'package:dio/dio.dart';
import 'package:route/route.dart';

/// {@template directions_resource}
/// Used for interacting with the Mapbox Directions API
///
/// https://docs.mapbox.com/api/navigation/directions/
/// {@endtemplate}
class DirectionsResource {
  /// {@macro directions_resource}
  const DirectionsResource(this._httpClient);

  final Dio _httpClient;

  /// Generate a route between the two points
  Future<Route> getRoute(LatLng from, LatLng to) async {
    final coordsString =
        '${from.longitude},${from.latitude};${to.longitude},${to.latitude}';
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        'directions/v5/mapbox/walking/$coordsString',
        queryParameters: {
          'radiuses': 'unlimited;unlimited',
          'overview': 'full',
        },
      );

      if (response.data?['code'] == 'Ok') {
        return Route.fromPolyline(response.data!['routes'][0]['geometry']);
      } else {
        throw FormatException('could not decode directions', response.data);
      }
    } on DioError catch (e) {
      throw HttpException('directions_response: ${e.response?.statusCode}');
    }
  }
}
