
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

/// Data for a map search result
class SearchResult {
  final String title;
  final String subtitle;
  final String fullText;
  final LatLng center;
  final LatLngBounds bounds;

  SearchResult(this.title, this.subtitle, this.fullText, this.center, this.bounds);
}