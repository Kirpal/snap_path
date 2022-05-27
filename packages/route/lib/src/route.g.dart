// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) {
  return Route(
    (json['coordinates'] as List<dynamic>)
        .map((e) => RoutePoint.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
    };
