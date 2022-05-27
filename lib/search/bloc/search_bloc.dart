import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:location_client/location_client.dart';
import 'package:route/route.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search_repository/search_repository.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required SearchRepository searchRepository,
    required LocationClient locationClient,
  })   : _searchRepository = searchRepository,
        _locationClient = locationClient,
        super(const SearchState());

  final SearchRepository _searchRepository;
  final LocationClient _locationClient;

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
    Stream<SearchEvent> events,
    transitionFn,
  ) {
    return super.transformEvents(
      MergeStream([
        events.where((e) => e is! _SearchSubmitted),
        events
            .whereType<_SearchSubmitted>()
            .debounceTime(const Duration(milliseconds: 300)),
      ]),
      transitionFn,
    );
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield* event.when(
      searchBarChanged: mapSearchBarChangedToState,
      cleared: mapSearchBarClearedToState,
      submitted: mapSearchSubmittedToState,
    );
  }

  Stream<SearchState> mapSearchBarClearedToState() async* {
    yield const SearchState();
  }

  Stream<SearchState> mapSearchBarChangedToState(String value) async* {
    if (value.isNotEmpty) {
      yield state.copyWith(searchBarEmpty: false);
      add(SearchEvent.submitted(
        value: value,
        center: _locationClient.latestLocation?.location,
      ));
    } else {
      yield const SearchState();
    }
  }

  Stream<SearchState> mapSearchSubmittedToState(
    String value,
    LatLng? center,
  ) async* {
    final results = await _searchRepository.search(value, center);
    yield state.copyWith(searchResults: results);
  }
}
