import 'package:dio/dio.dart';
import 'package:route/route.dart';

extension on Route {
  /// Split this [Route] into parts with fewer than [maxLength] coordinates
  List<Route> split(int maxLength) {
    final parts = coordinates.fold<List<List<RoutePoint>>>([], (parts, coord) {
      if (parts.isEmpty || parts.last.length >= 100) {
        parts.add([coord]);
      } else {
        parts.last.add(coord);
      }
      return parts;
    });
    return parts.map((c) => Route.fromCoordinates(c)).toList();
  }

  /// Convert this route into a string formatted for the Mapbox API
  String get mapboxString =>
      coordinates.map((l) => '${l.longitude},${l.latitude}').join(';');
}

extension on List<Route?> {
  Route joined() {
    final coordinates = fold<List<RoutePoint>>(
      [],
      (all, r) => all..addAll(r?.coordinates ?? []),
    );

    return Route.fromCoordinates(coordinates);
  }
}

/// {@template matching_resource}
/// Used for interacting with the Mapbox Map Matching API
///
/// https://docs.mapbox.com/api/navigation/map-matching/
/// {@endtemplate}
class MatchingResource {
  /// {@macro matching_resource}
  const MatchingResource(this._httpClient);

  final Dio _httpClient;

  /// Match the given route to nearby roads and trails,
  /// returning the matched version
  Future<Route> matchRoute(Route route) async {
    final parts = route.split(100);

    final matched = await Future.wait(parts.map((route) async {
      final coordsString = route.mapboxString;

      try {
        final response = await _httpClient.get<Map<String, dynamic>>(
          'matching/v5/mapbox/walking/$coordsString.json',
          queryParameters: {
            'radiuses': List.filled(route.coordinates.length, 50).join(';'),
          },
        );

        if (response.data?['code'] == 'Ok') {
          return Route.fromPolyline(response.data!['matchings'][0]['geometry']);
        }
      } catch (_) {
        return route;
      }
    }));

    return matched.joined();
  }
}
