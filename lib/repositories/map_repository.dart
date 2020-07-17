import 'dart:async';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/models/search_result.dart';

abstract class MapRepository {
  /// Get the elevation data along the given path
  Future<ElevationData> getElevation(List<LatLng> path);

  /// Match the given path to nearby roads and trails, returning the matched path
  Future<List<LatLng>> matchPath(List<LatLng> path);

  /// Search for results by the given query string,
  /// also takes an optional location to sort results by proximity
  Future<List<SearchResult>> search(String query, [LatLng currentLocation]);

  /// Get the url for an image representing the given path
  String getPreview(List<LatLng> coordinates, int width, int height);
}
