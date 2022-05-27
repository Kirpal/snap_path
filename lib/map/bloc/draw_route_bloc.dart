import 'dart:async';

import 'package:elevation_repository/elevation_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:replay_bloc/replay_bloc.dart';
import 'package:route/route.dart';
import 'package:route_repository/route_repository.dart';

part 'draw_route_bloc.freezed.dart';
part 'draw_route_event.dart';
part 'draw_route_state.dart';

class DrawRouteBloc extends ReplayBloc<DrawRouteEvent, DrawRouteState> {
  DrawRouteBloc({
    required RouteRepository routeRepository,
    required ElevationRepository elevationRepository,
  })  : _routeRepository = routeRepository,
        _elevationRepository = elevationRepository,
        super(DrawRouteState());

  final RouteRepository _routeRepository;
  final ElevationRepository _elevationRepository;

  @override
  bool shouldReplay(DrawRouteState state) =>
      state.routeInProgress.coordinates.isEmpty &&
      state.routes.length != this.state.routes.length;

  @override
  Stream<DrawRouteState> mapEventToState(
    DrawRouteEvent event,
  ) async* {
    yield* event.when(
      cleared: _mapClearedToState,
      ended: _mapEndedToState,
      pointAdded: _mapPointAddedToState,
      routeMatched: _mapRouteMatchedToState,
      elevationFetched: _mapElevationFetchedToState,
      routeReplaced: _mapRouteReplacedToState,
    );
  }

  Stream<DrawRouteState> _mapRouteReplacedToState(Route route) async* {
    yield DrawRouteState(routes: [route]);
  }

  Stream<DrawRouteState> _mapClearedToState() async* {
    yield DrawRouteState();
  }

  Stream<DrawRouteState> _mapEndedToState() async* {
    var newRoute = state.routeInProgress;
    if (state.routes.isNotEmpty && state.routes.last.coordinates.isNotEmpty) {
      newRoute = state.routes.last.coordinates.last + newRoute;
    }

    final List<Route> newRoutes;
    final int index;
    if (state.isFirstSingle) {
      newRoutes = [newRoute];
      index = 0;
    } else {
      newRoutes = [...state.routes, newRoute];
      index = state.routes.length;
    }

    yield DrawRouteState(
      routes: newRoutes,
      routeInProgress: const Route(),
    );

    final matched = await _routeRepository.match(newRoute);
    add(DrawRouteEvent.routeMatched(
      index,
      matched.equalize(const Distance(meters: 1)),
    ));
  }

  Stream<DrawRouteState> _mapRouteMatchedToState(
    int index,
    Route route,
  ) async* {
    yield state.replace(index, route);

    final elevatedRoute = await _elevationRepository.getElevation(route);
    add(DrawRouteEvent.elevationFetched(index, elevatedRoute));
  }

  Stream<DrawRouteState> _mapElevationFetchedToState(
    int index,
    Route route,
  ) async* {
    // _precomputeElevationPath();

    yield state.replace(index, route);
  }

  Stream<DrawRouteState> _mapPointAddedToState(LatLng point) async* {
    yield state.copyWith(
      routeInProgress: state.routeInProgress.extend(
        RoutePoint.fromLatLng(point),
      ),
    );
  }

  // /// Precompute the overall elevation based on the list of elevations
  // void _precomputeElevationPath() {
  //   _totalPath = Path();
  //   for (final p in _paths) {
  //     _totalPath.addAll(p.coordinates);
  //   }
  //   _totalPath.addAll(_openPath.coordinates);

  //   if (_totalPath.nrOfCoordinates > 650) {
  //     _simplifyPath(600);
  //   }

  //   _totalElevation = ElevationData();
  //   for (final elevationData in _elevations) {
  //     _totalElevation.add(elevationData);
  //   }
  // }

  // /// Reduce the number of coordinates to the given count
  // void _simplifyPath(int count) {
  //   final distanceBetween = state.route.distance / count;

  //   _totalPath = _totalPath.equalize(distanceBetween, smoothPath: false);

  //   _paths = _paths.map((p) {
  //     if (p.nrOfCoordinates >= 2) {
  //       if (p.distance <= distanceBetween) {
  //         return Path.from([p.first, p.last]);
  //       }

  //       return p.equalize(distanceBetween, smoothPath: false);
  //     }

  //     return p;
  //   }).toList();
  // }
}
