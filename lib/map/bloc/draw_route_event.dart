part of 'draw_route_bloc.dart';

@freezed
class DrawRouteEvent extends ReplayEvent with _$DrawRouteEvent {
  const factory DrawRouteEvent.cleared() = _Cleared;
  const factory DrawRouteEvent.ended() = _Ended;
  const factory DrawRouteEvent.pointAdded(LatLng point) = _PointAdded;
  const factory DrawRouteEvent.routeReplaced(Route route) = _RouteReplaced;

  @visibleForTesting
  const factory DrawRouteEvent.routeMatched(int index, Route route) =
      _RouteMatched;
  @visibleForTesting
  const factory DrawRouteEvent.elevationFetched(int index, Route route) =
      _ElevationFetched;
}
