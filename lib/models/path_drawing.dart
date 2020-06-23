import 'package:distance/distance.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/repositories/map_repository.dart';

class PathDrawingState extends ChangeNotifier {
  List<Path> _paths = [];
  List<Path> _oldPaths = [];
  List<ElevationData> _elevations = [];
  List<ElevationData> _oldElevations = [];
  Path _openPath = Path();
  ElevationData _totalElevation = ElevationData();
  Path _totalPath = Path();
  LatLng highlightedPoint;
  final MapRepository _mapRepository;
  
  PathDrawingState({
    @required MapRepository mapRepository,
  }) : _mapRepository = mapRepository;

  /// Add a new point to the path
  void addPoint(LatLng point) {
    _openPath.add(point);
    _totalPath.add(point);
    
    notifyListeners();
  }

  /// Equalize the given path if it's long enough
  Path _maybeEqualize(Path path, num distance, {bool smoothPath = false}) {
    if (path.distance > distance) {
      return path.equalize(distance, smoothPath: smoothPath);
    }

    return path;
  }

  /// End the current path
  /// 
  /// Saves the current path and snaps it to the nearest road or trail
  Future<void> endPath() async {
    var newPath = _openPath;
    _openPath = Path();
    _oldPaths = [];

    if (_paths.isNotEmpty) {
      newPath = Path.from([_paths.last.last, ...newPath.coordinates]);
    }

    if (newPath.nrOfCoordinates > 2) {
      newPath = _maybeEqualize(newPath, 15);
    }

    _paths.add(newPath);
    _elevations.add(ElevationData());
    
    var matchedPath = Path.from(await _mapRepository.matchPath(newPath.coordinates));
    var newElevation = await _mapRepository.getElevation(_maybeEqualize(matchedPath, 1).coordinates);

    int newPathIndex = _paths.indexOf(newPath);

    if (newPathIndex == 1 && _paths.first.nrOfCoordinates == 1) {
      _oldPaths = _paths.sublist(0, 1);
      _paths = _paths.sublist(1);
      newPathIndex = 0;
      
      _oldElevations = _elevations.sublist(0, 1);
      _elevations = _elevations.sublist(1);
    }
    
    if (newPathIndex >= 0 && newPathIndex < _paths.length) {
      _paths[newPathIndex] = matchedPath;
      _elevations[newPathIndex] = newElevation;
    }

    _precomputeElevationPath();

    notifyListeners();
  }

  /// Precompute the overall elevation based on the list of elevations
  void _precomputeElevationPath() {
    _totalPath = Path();
    _paths.forEach((p) => _totalPath.addAll(p.coordinates));
    _totalPath.addAll(_openPath.coordinates);

    _totalElevation = ElevationData();
    _elevations.forEach((elevationData) {
      _totalElevation.add(elevationData);
    });
  }

  /// Undo the last action
  void undo() {
    if (_oldPaths.isNotEmpty) {
      _paths = _oldPaths;
      _oldPaths = [];
      _elevations = _oldElevations;
      _oldElevations = [];

      _precomputeElevationPath();
      
      notifyListeners();
    } else if (_paths.isNotEmpty) {
      _paths.removeLast();
      _elevations.removeLast();

      _precomputeElevationPath();

      notifyListeners();
    }
  }

  /// Clear this path
  void clear() {
    _oldPaths = _paths;
    _paths = [];
    _oldElevations = _elevations;
    _elevations = [];
    _openPath = Path();

    _precomputeElevationPath();

    notifyListeners();
  }

  /// Highlight the point at the given distance (in meters)
  void highlightPoint(ElevationPoint point) {
    highlightedPoint = point.coordinate;

    notifyListeners();
  }

  /// Unhighlight the highlighted point
  void unhighlightPoint() {
    if (highlightedPoint != null) {
      highlightedPoint = null;

      notifyListeners();
    }
  }

  /// The elevation data for this path
  ElevationData get elevation => _totalElevation;

  /// Is there any action to be undone?
  bool get canUndo => _oldPaths.isNotEmpty || _paths.isNotEmpty;

  /// The length of the path drawn so far
  d.Distance get distance => d.Distance(micrometers: (_totalPath.distance * d.Distance.micrometersInMeter).round());

  /// The list of coordinates at the discrete distance markers
  List<LatLng> distanceMarkers(bool metric) {
    var lengthUnit = metric ? d.Distance(kilometers: 1) : d.Distance(miles: 1);
    if (_totalPath.distance < lengthUnit.inMeters) {
      return [];
    } else {
      var equalized = _totalPath.equalize(lengthUnit.inMeters, smoothPath: false).coordinates;

      equalized.removeAt(0);
      equalized.removeLast();

      return equalized;
    }
  }

  /// The coordinates in this path
  List<LatLng> get coordinates => List.from(_totalPath.coordinates);

  /// Does this path have any coordinates?
  bool get isNotEmpty => _totalPath.nrOfCoordinates > 0;

  /// The latitude and longitude bounds of the path
  LatLngBounds get bounds => LatLngBounds.fromPoints(coordinates);
}
