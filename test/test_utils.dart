import 'dart:io';

import 'package:gpx/gpx.dart';
import 'package:latlong/latlong.dart';

/// Holds data parsed from a gpx
class PathData {
  PathData({this.path, this.elevations});

  final List<LatLng> path;
  final List<double> elevations;
}

/// Read the data from a GPX file at the given file path
Future<PathData> readGpx(String filepath) async {
  final xmlString = await File(filepath).readAsString();
  final waypoints = <Wpt>[];

  GpxReader().fromString(xmlString).rtes.forEach((rte) {
    waypoints.addAll(rte.rtepts);
  });

  return PathData(
    path: waypoints.map((wpt) => LatLng(wpt.lat, wpt.lon)).toList(),
    elevations: waypoints.map((wpt) => wpt.ele).toList(),
  );
}
