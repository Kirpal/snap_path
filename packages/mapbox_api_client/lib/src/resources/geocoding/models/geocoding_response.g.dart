// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingResponse _$GeocodingResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew('GeocodingResponse', json, () {
    final val = GeocodingResponse(
      $checkedConvert(
          json,
          'features',
          (v) => (v as List<dynamic>)
              .map((e) => Feature.fromJson(e as Map<String, dynamic>))
              .toList()),
    );
    return val;
  });
}
