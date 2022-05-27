import 'package:distance/distance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart' hide Distance;
import 'package:route/route.dart';

part 'route_point.g.dart';

/// {@template distance_converter}
/// A custom [JsonConverter] to encode and decode distance data as json
/// {@endtemplate}
class DistanceConverter implements JsonConverter<Distance, int> {
  /// {@macro distance_converter}
  const DistanceConverter();

  @override
  Distance fromJson(int json) => Distance(micrometers: json);

  @override
  int toJson(Distance distance) => distance.inMicrometers.round();
}

/// {@template route_point}
/// Describes a geographical point along a route
///
/// Contains elevation, location, and distance along the route
/// {@endtemplate}
@JsonSerializable()
class RoutePoint extends LatLng with EquatableMixin {
  /// {@macro route_point}
  RoutePoint(
    double latitude,
    double longitude, {
    this.distance = Distance.zero,
    this.elevation = Distance.zero,
  }) : super(latitude, longitude);

  /// {@macro route_point}
  RoutePoint.meters(
    double latitude,
    double longitude, {
    double distance = 0,
    double elevation = 0,
  })  : distance = Distance(
          micrometers: (distance * Distance.micrometersInMeter).round(),
        ),
        elevation = Distance(
          micrometers: (elevation * Distance.micrometersInMeter).round(),
        ),
        super(latitude, longitude);

  /// {@macro route_point}
  RoutePoint.fromLatLng(LatLng latLng)
      : this(latLng.latitude, latLng.longitude);

  /// Deserialize a [RoutePoint] from a [Map<String, dynamnic>]
  factory RoutePoint.fromJson(Map<String, dynamic> json) =>
      _$RoutePointFromJson(json);

  /// Serialize this [RoutePoint] as a [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$RoutePointToJson(this);

  /// The total distance so far in the path at this point
  @DistanceConverter()
  final Distance distance;

  /// The elevation of this point
  @DistanceConverter()
  final Distance elevation;

  /// Create a copy of this [RoutePoint] with the provided fields overridden
  RoutePoint copyWith({
    double? latitude,
    double? longitude,
    Distance? distance,
    Distance? elevation,
  }) =>
      RoutePoint(
        latitude ?? this.latitude,
        longitude ?? this.longitude,
        distance: distance ?? this.distance,
        elevation: elevation ?? this.elevation,
      );

  /// Add this point to the beginning of the route, returning the new combined
  /// route
  Route operator +(Route route) =>
      Route.fromCoordinates([this, ...route.coordinates]);

  @override
  List<Object?> get props => [latitude, longitude, elevation, distance];
}
