import 'package:bounding_box/bounding_box.dart';
import 'package:route/route.dart';

/// {@template search_result}
/// Describes the information about a map search result
/// {@endtemplate}
class SearchResult {
  /// {@macro search_result}
  const SearchResult({
    required this.title,
    required this.subtitle,
    required this.fullText,
    required this.center,
    required this.boundingBox,
  });

  /// A short string describing this result
  final String title;

  /// More information about this result
  final String subtitle;

  /// The full text description of this result
  ///
  /// i.e an entire address
  final String fullText;

  /// The geographic center of this result
  final LatLng center;

  /// A geographic bounding box that frames this result
  final BoundingBox boundingBox;
}
