import 'package:mapbox_api_client/mapbox_api_client.dart';
import 'package:route/route.dart';

/// {@template route_repository}
/// A repository for manipulating and fetching routes
/// {@endtemplate}
class RouteRepository {
  /// {@macro route_repository}
  const RouteRepository({
    required MapboxApiClient apiClient,
  }) : _apiClient = apiClient;

  final MapboxApiClient _apiClient;

  /// Match the given route to the nearest roads and trails, returning the
  /// matched version
  ///
  /// If the given route has only two points, it will generate a complete route
  /// by following the shortest path between them
  Future<Route> match(Route route) async {
    if (route.coordinates.length > 2) {
      return _apiClient.matching.matchRoute(route);
    } else if (route.coordinates.length == 2) {
      return _apiClient.directions.getRoute(
        route.coordinates.first,
        route.coordinates.last,
      );
    }

    return route;
  }
}
