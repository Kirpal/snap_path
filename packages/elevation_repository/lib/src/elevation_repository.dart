import 'package:mapbox_api_client/mapbox_api_client.dart';
import 'package:route/route.dart';

/// {@template elevation_repository}
/// A repository for retrieving information relating to elevation
/// {@endtemplate}
class ElevationRepository {
  /// {@macro elevation_repository}
  const ElevationRepository({required MapboxApiClient apiClient})
      : _apiClient = apiClient;

  final MapboxApiClient _apiClient;

  /// Get the elevation data along the given route
  Future<Route> getElevation(Route route) async {
    if (route.coordinates.isNotEmpty) {
      final elevations = await Future.wait(route.coordinates.map((coord) async {
        final elevation = await _apiClient.terrain.getElevation(coord);
        return coord.copyWith(elevation: elevation);
      }));

      return Route.fromCoordinates(elevations);
    } else {
      return const Route();
    }
  }
}
