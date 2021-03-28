import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/search_result.dart';
import 'package:snap_path/repositories/map_repository.dart';

class SearchPageState extends ChangeNotifier {
  SearchPageState({@required MapRepository mapRepository})
      : _mapRepository = mapRepository,
        controller = TextEditingController(),
        searchBarEmpty = true,
        searchResults = [];

  final TextEditingController controller;
  final MapRepository _mapRepository;
  bool searchBarEmpty;
  List<SearchResult> searchResults;
  Timer _searchTimer;

  /// Clear the search bar and results
  void clear() {
    searchBarEmpty = true;
    controller.clear();
    searchResults = [];

    notifyListeners();
  }

  /// Called when the search bar value changes
  void searchBarOnChanged(String value, LatLng center) {
    if ((searchBarEmpty && value.isNotEmpty) ||
        (!searchBarEmpty && value.isEmpty)) {
      searchBarEmpty = value.isEmpty;

      notifyListeners();
    }

    _searchTimer?.cancel();
    if (value.isNotEmpty) {
      _searchTimer = Timer(
          const Duration(milliseconds: 300),
          () => _mapRepository.search(value, center).then((results) {
                searchResults = results;
                notifyListeners();
              }));
    } else {
      searchResults = [];

      notifyListeners();
    }
  }

  /// Select the given search result
  void selectResult(SearchResult result) {
    searchBarEmpty = false;
    controller.text = result.fullText;
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    controller.dispose();

    super.dispose();
  }
}
