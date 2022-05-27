import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location_client/location_client.dart';
import 'package:route/route.dart';
import 'package:search_repository/search_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({
    required LocationClient locationClient,
  })   : _locationClient = locationClient,
        super(const MapState()) {
    _locationClient.userLocation.listen(_onUserLocationUpdate);
  }

  final LocationClient _locationClient;

  void _onUserLocationUpdate(UserLocation location) =>
      add(MapEvent.userLocationUpdated(location));

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    yield* event.when(
      started: _mapStartedToState,
      controlsToggled: _mapControlsToggledToState,
      userLocationUpdated: _mapUserLocationUpdatedToState,
      userLocationFocused: _mapUserLocationFocusedToState,
      userLocationUnfocused: _mapUserLocationUnfocusedToState,
      searchResultSelected: _mapSearchResultSelectedToState,
      searchResultUnselected: _mapSearchResultUnselectedToState,
      pointHighlighted: _mapPointHighlightedToState,
      pointUnhighlighted: _mapPointUnhighlightedToState,
    );
  }

  Stream<MapState> _mapPointHighlightedToState(RoutePoint point) async* {
    yield state.copyWith(highlightedPoint: point);
  }

  Stream<MapState> _mapPointUnhighlightedToState() async* {
    yield state.copyWith(highlightedPoint: null);
  }

  Stream<MapState> _mapSearchResultSelectedToState(
    SearchResult searchResult,
  ) async* {
    yield state.copyWith(searchResult: searchResult);
  }

  Stream<MapState> _mapSearchResultUnselectedToState() async* {
    yield state.copyWith(searchResult: null);
  }

  Stream<MapState> _mapUserLocationFocusedToState() async* {
    yield state.copyWith(userLocationFocused: true);
  }

  Stream<MapState> _mapUserLocationUnfocusedToState() async* {
    yield state.copyWith(userLocationFocused: false);
  }

  Stream<MapState> _mapStartedToState() async* {
    if (!state.locationInitialized) {
      final canGetLocation = await _locationClient.initialize();
      yield state.copyWith(
        locationInitialized: true,
        canGetLocation: canGetLocation,
      );
    }
  }

  Stream<MapState> _mapControlsToggledToState([bool? show]) async* {
    yield state.copyWith(controlsVisible: show ?? !state.controlsVisible);
  }

  Stream<MapState> _mapUserLocationUpdatedToState(
    UserLocation userLocation,
  ) async* {
    yield state.copyWith(userLocation: userLocation);
  }
}
