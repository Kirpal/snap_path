part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.started() = _Started;
  const factory MapEvent.controlsToggled([bool? show]) = _ControlsToggled;
  const factory MapEvent.userLocationUpdated(UserLocation location) =
      _UserLocationUpdated;
  const factory MapEvent.userLocationFocused() = _UserLocationFocused;
  const factory MapEvent.userLocationUnfocused() = _UserLocationUnfocused;
  const factory MapEvent.searchResultSelected(SearchResult searchResult) =
      _SearchResultSelected;
  const factory MapEvent.searchResultUnselected() = _SearchResultUnselected;
  const factory MapEvent.pointHighlighted(RoutePoint point) = _PointHighlighted;
  const factory MapEvent.pointUnhighlighted() = _PointUnhighlighted;
}
