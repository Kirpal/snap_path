import 'dart:math';

import 'package:distance/distance.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong/latlong.dart' as ll;

class ElevationPoint extends Equatable {
  /// The map coordinate of this elevation point
  final ll.LatLng coordinate;
  /// The elevation of this point in meters
  final double elevation;
  /// The total distance so far in the path at this point
  final double distance;

  ElevationPoint({this.coordinate, this.elevation, this.distance});

  @override
  List<Object> get props => [coordinate, elevation, distance];

  @override
  String toString() => 'ElevationPoint('
    'coordinate: $coordinate, distance: $distance, elevation: $elevation)';
}

class ElevationData extends Equatable {
  /// Elevation points as a list of (distance, elevation) in meters
  final List<ElevationPoint> _points;
  /// Pre-filtered list of elevation points
  final List<ElevationPoint> _filteredPoints;

  ElevationData._(this._points) : _filteredPoints = _filterPoints(_points);

  /// Empty data
  ElevationData() : this._([]);

  /// Create elevation data from the given points
  ElevationData.from(List<ElevationPoint> points) : this._(points);

  /// Filter the given elevations according to the threshold
  static List<ElevationPoint> _filterPoints(List<ElevationPoint> points, {double threshold = 3.5}) {
    if (points.isNotEmpty) {
      // Sort the points in ascending distance order
      var sorted = points..sort((a, b) => a.distance.compareTo(b.distance));

      List<ElevationPoint> filteredPoints = [];
      ElevationPoint current = sorted.first;

      filteredPoints.add(sorted.first);
      sorted.skip(1).forEach((point) {
        if (point.elevation != null
        && (point.elevation - current.elevation > threshold ||
            point.elevation - current.elevation < -threshold)) {
          filteredPoints.add(point);
          current = point;
        }
      }); 

      return filteredPoints;
    } else {
      return [];
    }
  }

  @override
  List<Object> get props => _points;

  /// The maximum distance in this data
  double get _maxX => hasData ? _points.fold(0, (m, p) => max(m, p.distance)) : 0;
  
  /// Add the given elevation data to the end of this data
  void add(ElevationData other) {
    double totalDistance = _maxX;
    double lastDistance = 0;
    other._points.forEach((p) {
      totalDistance += p.distance - lastDistance;
      _points.add(ElevationPoint(
        distance: totalDistance,
        elevation: p.elevation,
        coordinate: p.coordinate,
      ));
      lastDistance = p.distance;
    });

    _filteredPoints..clear()..addAll(_filterPoints(_points));
  }

  /// The points in this elevation data as (distance, elevation) in meters, with small variations 
  /// filtered out
  List<ElevationPoint> get filtered => _filteredPoints;

  /// The points in this elevation data as (distance, elevation) in meters, unfiltered
  List<ElevationPoint> get unfiltered => _points;

  /// The total elevation gained (ascent)
  Distance get gain {
    double totalGain = 0;
    for (var i = 1; i < _filteredPoints.length; i++) {
      totalGain += max(0, _filteredPoints[i].elevation - _filteredPoints[i - 1].elevation);
    }

    return Distance(micrometers: (totalGain * Distance.micrometersInMeter).round());
  }

  /// Is there any data in this?
  bool get hasData => _points.isNotEmpty;
}