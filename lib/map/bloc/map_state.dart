part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(true) bool controlsVisible,
    @Default(false) bool locationInitialized,
    @Default(false) bool canGetLocation,
    @Default(true) bool userLocationFocused,
    UserLocation? userLocation,
    SearchResult? searchResult,
    RoutePoint? highlightedPoint,
  }) = _MapState;
}
