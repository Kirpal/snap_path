import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'geocoding_response.g.dart';

/// {@template geocoding_response}
/// A response from the Mapbox Geocoding API
///
/// https://docs.mapbox.com/api/search/geocoding/#geocoding-response-object
/// {@endtemplate}
@JsonSerializable()
class GeocodingResponse {
  /// {@macro geocoding_response}
  const GeocodingResponse(this.features);

  /// Deserialize a [GeocodingResponse] from a [Map<String, dynamic>]
  factory GeocodingResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResponseFromJson(json);

  /// The list of features returned in this response
  final List<Feature> features;
}
