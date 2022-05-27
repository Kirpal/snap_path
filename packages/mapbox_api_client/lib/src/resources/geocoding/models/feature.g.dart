// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureContext _$FeatureContextFromJson(Map<String, dynamic> json) {
  return $checkedNew('FeatureContext', json, () {
    final val = FeatureContext(
      text: $checkedConvert(json, 'text', (v) => v as String),
      placeType: $checkedConvert(
          json, 'id', (v) => FeatureContext._placeTypeFromJson(v as String)),
    );
    return val;
  }, fieldKeyMap: const {'placeType': 'id'});
}

Feature _$FeatureFromJson(Map<String, dynamic> json) {
  return $checkedNew('Feature', json, () {
    final val = Feature(
      text: $checkedConvert(json, 'text', (v) => v as String),
      placeTypes: $checkedConvert(
          json,
          'place_type',
          (v) => (v as List<dynamic>)
              .map((e) => _$enumDecode(_$PlaceTypeEnumMap, e))
              .toList()),
      center:
          $checkedConvert(json, 'center', (v) => _latLngFromJson(v as List)),
      context: $checkedConvert(
          json,
          'context',
          (v) => (v as List<dynamic>?)
              ?.map((e) => FeatureContext.fromJson(e as Map<String, dynamic>))
              .toList()),
      placeName: $checkedConvert(json, 'place_name', (v) => v as String),
      bbox: $checkedConvert(
          json,
          'bbox',
          (v) => v == null
              ? null
              : BoundingBox.fromJson((v as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())),
      address: $checkedConvert(json, 'address', (v) => v as String?),
    );
    return val;
  }, fieldKeyMap: const {
    'placeTypes': 'place_type',
    'placeName': 'place_name'
  });
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PlaceTypeEnumMap = {
  PlaceType.country: 'country',
  PlaceType.region: 'region',
  PlaceType.postcode: 'postcode',
  PlaceType.district: 'district',
  PlaceType.place: 'place',
  PlaceType.locality: 'locality',
  PlaceType.neighborhood: 'neighborhood',
  PlaceType.address: 'address',
  PlaceType.poi: 'poi',
};
