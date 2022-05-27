// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutePoint _$RoutePointFromJson(Map<String, dynamic> json) {
  return RoutePoint(
    (json['latitude'] as num).toDouble(),
    (json['longitude'] as num).toDouble(),
    distance: const DistanceConverter().fromJson(json['distance'] as int),
    elevation: const DistanceConverter().fromJson(json['elevation'] as int),
  );
}

Map<String, dynamic> _$RoutePointToJson(RoutePoint instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distance': const DistanceConverter().toJson(instance.distance),
      'elevation': const DistanceConverter().toJson(instance.elevation),
    };
