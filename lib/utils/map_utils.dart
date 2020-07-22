import 'package:latlong/latlong.dart';
import 'package:polyline/polyline.dart';

/// Utility functions for maps
class MapUtils {
  /// Convert the given polyline string to a list of latlng coordinates
  static List<LatLng> polylineToCoordinates(String polyline) {
    var rawCoordinates = Polyline.Decode(encodedString: polyline).decodedCoords;

    return rawCoordinates.map((coord) => LatLng(coord[0], coord[1])).toList();
  }

  /// Convert the given list of coordinates to a polyline string
  static String coordinatesToPolyline(List<LatLng> coordinates) {
    var polyline = Polyline.Encode(
        decodedCoords:
            coordinates.map((l) => [l.latitude, l.longitude]).toList());

    return polyline.encodedString;
  }
}
