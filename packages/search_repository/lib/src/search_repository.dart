import 'package:bounding_box/bounding_box.dart';
import 'package:mapbox_api_client/mapbox_api_client.dart';
import 'package:route/route.dart';

import 'models/models.dart';

/// A failure that occurs while searching
class SearchException implements Exception {
  /// Create a new [SearchException]
  const SearchException();
}

extension<E> on Iterable<E> {
  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// If no element satisfies [test], then null is returned
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

/// {@template search_repository}
/// A repository for searching locations&#x2F;places
/// {@endtemplate}
class SearchRepository {
  /// {@macro search_repository}
  const SearchRepository({required MapboxApiClient apiClient})
      : _apiClient = apiClient;

  final MapboxApiClient _apiClient;

  /// Search for the query string, sorting by proximity
  /// to the optional [currentLocation]
  ///
  /// Length of [query] must be > 0 and <= 256 characters
  ///
  /// Throws a [SearchException] if the request fails
  Future<List<SearchResult>> search(
    String query, [
    LatLng? currentLocation,
  ]) async {
    final results = <SearchResult>[];

    late final GeocodingResponse response;
    try {
      response = await _apiClient.geocoding.search(query, currentLocation);
    } catch (_) {
      throw const SearchException();
    }

    for (final feature in response.features) {
      var title = feature.text;
      if (feature.address != null && feature.placeType == PlaceType.address) {
        title = '${feature.address} $title';
      }

      var subtitle = '';

      final place = feature.context
          ?.firstWhereOrNull((f) => f.placeType == PlaceType.place)
          ?.text;
      final region = feature.context
          ?.firstWhereOrNull((f) => f.placeType == PlaceType.region)
          ?.text;
      final country = feature.context
          ?.firstWhereOrNull((f) => f.placeType == PlaceType.country)
          ?.text;

      if (place != null) {
        subtitle += place;

        if (region != null || country != null) {
          subtitle += ', ';
        }
      }
      if (region != null) {
        subtitle += region;

        if (place == null && country != null) {
          subtitle += ', ';
        }
      }
      if (country != null && place == null) {
        subtitle += country;
      }

      results.add(SearchResult(
        title: title,
        subtitle: subtitle,
        fullText: feature.placeName,
        center: feature.center,
        boundingBox: feature.bbox ?? BoundingBox.fromPoints([feature.center]),
      ));
    }

    return results;
  }
}
