import 'package:bounding_box/bounding_box.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:route/route.dart';

part 'feature.g.dart';

LatLng _latLngFromJson(List latLng) => LatLng(
      latLng[1].toDouble(),
      latLng[0].toDouble(),
    );

/// Describes the specific geographic type of a feature
enum PlaceType {
  /// Generally recognized countries or, in some cases like Hong Kong,
  /// an area of quasi-national administrative status that has been given
  /// a designated country code under ISO 3166-1.
  country,

  /// Top-level sub-national administrative features,
  /// such as states in the United States or provinces in Canada or China.
  region,

  /// Postal codes used in country-specific national addressing systems.
  postcode,

  /// Features that are smaller than top-level administrative features but
  /// typically larger than cities, in countries that use such an additional
  /// layer in postal addressing (for example, prefectures in China).
  district,

  /// Typically these are cities, villages, municipalities, etc.
  /// They’re usually features used in postal addressing, and are suitable
  /// for display in ambient end-user applications where current-location
  /// context is needed (for example, in weather displays).
  place,

  /// Official sub-city features present in countries where such an additional
  /// administrative layer is used in postal addressing, or where such features
  /// are commonly referred to in local parlance.
  ///
  /// Examples include city districts in Brazil and Chile
  /// and arrondissements in France.
  locality,

  /// Colloquial sub-city features often referred to in local parlance.
  /// Unlike locality features, these typically lack official status and
  /// may lack universally agreed-upon boundaries.
  neighborhood,

  /// Individual residential or business addresses.
  address,

  /// Points of interest.
  /// These include restaurants, stores, concert venues, parks, museums, etc.
  poi,
}

/// {@template feature_context}
/// Provides context for a geographic feature
///
/// Similar to a [Feature], but with less data.
/// {@endtemplate}
@JsonSerializable()
class FeatureContext {
  /// {@macro feature_context}
  const FeatureContext({
    required this.text,
    required this.placeType,
  });

  /// Deserialize a [FeatureContext] from a [Map<String, dynamic>]
  factory FeatureContext.fromJson(Map<String, dynamic> json) =>
      _$FeatureContextFromJson(json);

  /// A string representing the feature in the requested language, if specified.
  final String text;

  /// A feature type describing the feature.
  ///
  /// Options are country, region, postcode, district, place, locality,
  /// neighborhood, address, and poi.
  @JsonKey(name: 'id', fromJson: _placeTypeFromJson)
  final PlaceType placeType;

  static PlaceType _placeTypeFromJson(String json) {
    return _$enumDecode(_$PlaceTypeEnumMap, json.split('.').first);
  }
}

/// {@template feature}
/// A geographic feature with metadata and location
/// {@endtemplate}
@JsonSerializable()
class Feature {
  /// {@macro feature}
  const Feature({
    required this.text,
    required this.placeTypes,
    required this.center,
    required this.context,
    required this.placeName,
    required this.bbox,
    this.address,
  });

  /// Deserialize a [Feature] from a [Map<String, dynamic>]
  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  /// A string representing the feature in the requested language, if specified.
  final String text;

  /// A string of the house number for the returned address feature.
  final String? address;

  /// A string representing the feature in the requested language, if specified,
  /// and its full result hierarchy.
  final String placeName;

  /// An array of feature types describing the feature.
  ///
  /// Options are country, region, postcode, district, place, locality,
  /// neighborhood, address, and poi.
  ///
  /// Most features have only one type, but if the feature has multiple types,
  /// all applicable types will be listed in the array.
  /// (For example, Vatican City is a country, region, and place.)
  @JsonKey(name: 'place_type')
  final List<PlaceType> placeTypes;

  /// A helper to get the first feature type describing this feature
  ///
  /// See [placeTypes] for details
  PlaceType get placeType => placeTypes.first;

  /// An array representing the hierarchy of encompassing parent features.
  final List<FeatureContext>? context;

  /// The coordinates of the feature’s center. This may be the literal centroid
  /// of the feature’s geometry, or the center of human activity within the
  /// feature (for example, the downtown area of a city).
  @JsonKey(fromJson: _latLngFromJson)
  final LatLng center;

  /// The geographic bounding box that surrounds this feature
  final BoundingBox? bbox;
}
