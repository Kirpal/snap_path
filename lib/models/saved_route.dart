import 'package:distance/distance.dart';
import 'package:latlong/latlong.dart' show LatLng, Path;
import 'package:snap_path/utils/map_utils.dart';
import 'package:snap_path/utils/utils.dart';

/// Holds information about a saved route (elevation, distance, etc.)
class SavedRouteData {
  SavedRouteData(List<LatLng> coordinates, this.elevationGain)
      : _path = Path.from(coordinates);

  SavedRouteData.decode(String encodedString)
      : this(
            MapUtils.polylineToCoordinates(
                Uri.decodeComponent(encodedString.split('/')[1])),
            Distance(micrometers: int.parse(encodedString.split('/')[0])));

  final Path _path;
  final Distance elevationGain;

  Distance get distance => _path.distance.toDistance();

  List<LatLng> get coordinates => _path.coordinates;

  String get encoded {
    final encodedPolyline =
        Uri.encodeComponent(MapUtils.coordinatesToPolyline(coordinates));
    final micrometers = elevationGain.inMicrometers.round();

    return '$micrometers/$encodedPolyline';
  }
}
