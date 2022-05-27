import 'package:dio/dio.dart';

import 'resources/resources.dart';

/// {@template mapbox_api_client}
/// An api client for interfacing with the mapbox backend
/// {@endtemplate}
class MapboxApiClient {
  /// {@macro mapbox_api_client}
  MapboxApiClient._({required Dio httpClient}) : _httpClient = httpClient;

  /// {@macro mapbox_api_client}
  MapboxApiClient.production(String mapboxKey)
      : this._(
          httpClient: Dio(BaseOptions(
            baseUrl: 'https://api.mapbox.com/',
            queryParameters: {
              'access_token': mapboxKey,
            },
          )),
        );

  final Dio _httpClient;

  MatchingResource? _matchingResource;
  DirectionsResource? _directionsResource;
  TerrainResource? _terrainResource;
  GeocodingResource? _geocodingResource;

  /// {@macro matching_resource}
  MatchingResource get matching =>
      _matchingResource ??= MatchingResource(_httpClient);

  /// {@macro directions_resource}
  DirectionsResource get directions =>
      _directionsResource ??= DirectionsResource(_httpClient);

  /// {@macro terrain_resource}
  TerrainResource get terrain =>
      _terrainResource ??= TerrainResource(_httpClient);

  /// {@macro geocoding}
  GeocodingResource get geocoding =>
      _geocodingResource ??= GeocodingResource(_httpClient);
}
