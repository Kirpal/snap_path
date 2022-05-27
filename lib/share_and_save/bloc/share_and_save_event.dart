part of 'share_and_save_bloc.dart';

@freezed
class ShareAndSaveEvent with _$ShareAndSaveEvent {
  const factory ShareAndSaveEvent.started() = _Started;
  const factory ShareAndSaveEvent.routesUpdated(List<Route> routes) =
      _RoutesUpdated;
  const factory ShareAndSaveEvent.routeSaved(Route route) = _RouteSaved;
  const factory ShareAndSaveEvent.routeDeleted(Route route) = _RouteDeleted;
}
