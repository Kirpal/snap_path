import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:route/route.dart';

import 'models/models.dart';

/// {@template geocoding_resource}
/// Used for interacting with the Mapbox Geocoding API
///
/// https://docs.mapbox.com/api/search/geocoding/
/// {@endtemplate}
class GeocodingResource {
  /// {@macro geocoding_resource}
  const GeocodingResource(this._httpClient);

  final Dio _httpClient;

  /// Search for the query string, sorting by proximity to the optional [center]
  ///
  /// Length of [query] must be > 0 and <= 256 characters
  ///
  /// Throws a [HttpException] if the request fails
  /// and a [FormatException] if the response cannot be decoded
  Future<GeocodingResponse> search(String query, [LatLng? center]) async {
    if (query.isEmpty || query.length > 256) {
      throw ArgumentError.value(
        query,
        'query',
        'Length must be > 0 and <= 256',
      );
    }

    final sanitizedQuery = Uri.encodeComponent(query.replaceAll(';', ''));
    final Response<String> response;
    try {
      response = await _httpClient.get(
        'geocoding/v5/mapbox.places/$sanitizedQuery.json',
        queryParameters: {
          'limit': 10,
          if (center != null)
            'proximity': '${center.longitude},${center.latitude}',
        },
      );
    } on DioError catch (e) {
      throw HttpException('search_response: ${e.response?.statusCode}');
    }

    try {
      return GeocodingResponse.fromJson(json.decode(response.data!));
    } catch (e) {
      throw FormatException(
        'geocoding response cannot be parsed',
        response.data,
      );
    }
  }
}
