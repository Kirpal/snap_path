part of 'draw_route_bloc.dart';

@freezed
class DrawRouteState with _$DrawRouteState {
  DrawRouteState._();

  factory DrawRouteState({
    @visibleForTesting @Default([]) List<Route> routes,
    @visibleForTesting @Default(Route()) Route routeInProgress,
  }) = _DrawRouteState;

  late final Route route = routes.route + routeInProgress;

  @visibleForTesting
  DrawRouteState replace(int index, Route route) {
    if (index < 0 || index >= routes.length) throw IndexError(index, routes);

    final newRoutes = List.of(routes);
    newRoutes[index] = route;

    return copyWith(routes: newRoutes);
  }

  @visibleForTesting
  bool get isFirstSingle =>
      routes.isNotEmpty && routes.first.coordinates.length == 1;
}

extension on List<Route> {
  Route get route => Route.fromCoordinates(allCoordinates);

  List<RoutePoint> get allCoordinates => fold<List<RoutePoint>>(
        [],
        (coords, route) => coords + route.coordinates,
      );
}
