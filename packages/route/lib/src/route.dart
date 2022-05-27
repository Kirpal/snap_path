import 'package:bounding_box/bounding_box.dart';
import 'package:distance/distance.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:gpx/gpx.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart' hide Distance;
import 'package:latlong2/latlong.dart' as d show Distance;
import 'package:route/models/route_point.dart';

part 'route.g.dart';

/// Used to encode a list of geogrphic points as a polyline
extension PolylineX on List<LatLng> {
  /// A representation of these points as a polyline
  String get polyline =>
      encodePolyline(map((l) => [l.latitude, l.longitude]).toList());
}

/// {@template route}
/// A route on a map
/// {@endtemplate}
@JsonSerializable()
class Route {
  /// Create an empty route
  const Route([this.coordinates = const []]);

  /// Create a new route from the given list of geographic coordinates
  factory Route.fromCoordinates(List<RoutePoint> coordinates) {
    if (coordinates.isEmpty) return const Route();

    final newCoords = List.of(coordinates);
    var totalDistance = 0.0;
    var prevCoord = coordinates.first;
    for (var i = 0; i < coordinates.length; i += 1) {
      final coord = coordinates[i];
      totalDistance += const d.Distance().distance(coord, prevCoord);
      newCoords[i] = coord.copyWith(
        distance: Distance(
          micrometers: (totalDistance * Distance.micrometersInMeter).round(),
        ),
      );
      prevCoord = coord;
    }

    return Route(newCoords);
  }

  /// Create a new route by parsing the given xml string as a gpx file
  factory Route.fromGpx(String xml) {
    var coordinates = <RoutePoint>[];
    final gpx = GpxReader().fromString(xml);
    if (gpx.trks.isNotEmpty && gpx.trks.first.trksegs.isNotEmpty) {
      coordinates = gpx.trks.first.trksegs.first.trkpts
          .map((w) => RoutePoint.meters(w.lat, w.lon, elevation: w.ele ?? 0))
          .toList();
    }

    return Route.fromCoordinates(coordinates);
  }

  /// Create a new route by parsing the given polyline encoded string
  factory Route.fromPolyline(String polyline) {
    final rawCoordinates = decodePolyline(polyline);

    final coordinates = rawCoordinates
        .map((coord) => RoutePoint(
              coord[0].toDouble(),
              coord[1].toDouble(),
            ))
        .toList();

    return Route.fromCoordinates(coordinates);
  }

  /// Deserialize a [Route] from a [Map<String, dynamic>]
  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  /// Serialize this route as a [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$RouteToJson(this);

  /// The list of geographic points that make up this route
  final List<RoutePoint> coordinates;

  /// The points in this route with small variations in elevation filtered out
  List<RoutePoint> get filtered {
    const elevationThreshold = Distance(meters: 10);
    if (coordinates.isNotEmpty) {
      // Sort the points in ascending distance order
      final sorted = List.of(coordinates)
        ..sort((a, b) => a.distance.compareTo(b.distance));

      final filteredPoints = <RoutePoint>[];
      var current = sorted.first;

      filteredPoints.add(sorted.first);
      sorted.skip(1).forEach((point) {
        if (point.elevation - current.elevation > elevationThreshold ||
            point.elevation - current.elevation < -elevationThreshold) {
          filteredPoints.add(point);
          current = point;
        }
      });
      filteredPoints.add(sorted.last);

      return filteredPoints;
    } else {
      return [];
    }
  }

  /// The total elevation gained (ascent)
  Distance get elevationGain {
    var totalGain = Distance.zero;
    for (var i = 1; i < filtered.length; i++) {
      if (filtered[i].elevation > filtered[i - 1].elevation) {
        totalGain += filtered[i].elevation - filtered[i - 1].elevation;
      }
    }

    return totalGain;
  }

  /// A representation of this route as a polyline
  String get polyline => coordinates.polyline;

  /// The total length of this route as a [Distance]
  Distance get distance =>
      coordinates.isEmpty ? Distance.zero : coordinates.last.distance;

  // Distance(
  //   meters: Path.from(coordinates).distance.round(),
  // );

  /// Indicates if this route has any points with elevation data
  bool get hasElevationData =>
      filtered.any((p) => p.elevation != Distance.zero);

  /// The geographic bounds that surround this route
  BoundingBox get bounds => BoundingBox.fromPoints(coordinates);

  /// The list of coordinates at the discrete distance markers
  List<RoutePoint> distanceMarkers(bool metric) {
    final lengthUnit =
        metric ? const Distance(kilometers: 1) : const Distance(miles: 1);
    if (distance < lengthUnit) {
      return [];
    } else {
      final equalized = equalize(lengthUnit).coordinates
        ..removeAt(0)
        ..removeLast();

      return equalized;
    }
  }

  /// Add the given elevation data to the end of this data
  Route operator +(Route other) {
    final points = List.of(coordinates);
    var totalDistance = coordinates.fold<Distance>(
        Distance.zero, (m, p) => m > p.distance ? m : p.distance);
    var lastDistance = Distance.zero;
    for (final p in other.coordinates) {
      totalDistance += p.distance - lastDistance;
      points.add(p.copyWith(distance: totalDistance));
      lastDistance = p.distance;
    }

    return Route(points);
  }

  /// Splits this route into even sections
  ///
  /// The section size is given by [distancePerTime]. This means that the
  /// distance on the original path will remain the same, but the new section
  /// might be shorter. However, following the sections in a given time will
  /// yield almost the same distance from point to point
  Route equalize(Distance distancePerTime) {
    if (distance > distancePerTime) {
      final path = Path.from(coordinates);
      final equalized =
          path.equalize(distancePerTime.inMeters, smoothPath: false);

      return Route.fromCoordinates(
          equalized.coordinates.map((p) => RoutePoint.fromLatLng(p)).toList());
    }
    return this;
  }

  /// Create a new route with the given point added to the end
  Route extend(RoutePoint point) {
    if (coordinates.isNotEmpty) {
      final distance = const d.Distance().distance(coordinates.last, point);
      final distancePoint = point.copyWith(
        distance: Distance(
          micrometers: (distance * Distance.micrometersInMeter).round(),
        ),
      );
      return Route([...coordinates, distancePoint]);
    } else {
      return Route([point.copyWith(distance: Distance.zero)]);
    }
  }
}
