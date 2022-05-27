import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route/route.dart';
import 'package:saved_route_repository/saved_route_repository.dart';

part 'share_and_save_event.dart';
part 'share_and_save_state.dart';

part 'share_and_save_bloc.freezed.dart';

class ShareAndSaveBloc extends Bloc<ShareAndSaveEvent, ShareAndSaveState> {
  ShareAndSaveBloc({
    required SavedRouteRepository savedRouteRepository,
  })   : _savedRouteRepository = savedRouteRepository,
        super(const ShareAndSaveState.loading());

  final SavedRouteRepository _savedRouteRepository;
  StreamSubscription<List<Route>>? _routeSubscription;

  @override
  Future<void> close() {
    _routeSubscription?.cancel();

    return super.close();
  }

  @override
  Stream<ShareAndSaveState> mapEventToState(
    ShareAndSaveEvent event,
  ) async* {
    yield* event.when(
      started: _mapStartedToState,
      routeDeleted: _mapRouteDeletedToState,
      routeSaved: _mapRouteSavedToState,
      routesUpdated: _mapRoutesUpdatedToState,
    );
  }

  Stream<ShareAndSaveState> _mapStartedToState() async* {
    _routeSubscription = _savedRouteRepository.savedRoutes
        .listen((routes) => add(ShareAndSaveEvent.routesUpdated(routes)));
    await _savedRouteRepository.loadSavedRoutes();
  }

  Stream<ShareAndSaveState> _mapRoutesUpdatedToState(
      List<Route> routes) async* {
    yield ShareAndSaveState.loaded(savedRoutes: routes);
  }

  Stream<ShareAndSaveState> _mapRouteSavedToState(Route route) async* {
    _savedRouteRepository.save(route);
  }

  Stream<ShareAndSaveState> _mapRouteDeletedToState(Route route) async* {
    _savedRouteRepository.delete(route);
  }
}
