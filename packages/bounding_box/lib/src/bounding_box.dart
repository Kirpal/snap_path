import 'package:route/route.dart';

/// {@template bounding_box}
/// A geographic bounding box describing an area
/// {@endtemplate}
class BoundingBox {
  /// {@macro bounding_box}
  const BoundingBox._({
    required double north,
    required double south,
    required double east,
    required double west,
  })   : _north = north,
        _south = south,
        _east = east,
        _west = west;

  /// Construct a [BoundingBox] from the given points
  ///
  /// The created box will surround all the points with no padding
  factory BoundingBox.fromPoints(List<LatLng> points) {
    if (points.isEmpty) return BoundingBox.zero;

    final latitudes = points.map((p) => p.latitude).toList()..sort();
    final longitudes = points.map((p) => p.longitude).toList()..sort();

    return BoundingBox._(
      north: latitudes.last,
      south: latitudes.first,
      east: longitudes.last,
      west: longitudes.first,
    );
  }

  /// Deserialize a [BoundingBox] from a [List<double>]
  factory BoundingBox.fromJson(List<double> json) => BoundingBox._(
        west: json[0],
        south: json[1],
        east: json[2],
        north: json[3],
      );

  /// Serialize a [BoundingBox] to a [List<double>]
  List<double> toJson() => [_west, _south, _east, _north];

  /// A [BoundingBox] with no area, centered at the null island
  static const zero = BoundingBox._(north: 0, south: 0, east: 0, west: 0);

  // latitudes
  final double _north;
  final double _south;

  // longitudes
  final double _east;
  final double _west;

  /// The north east corner of this bounding box
  LatLng get northEast => LatLng(_north, _east);

  /// The north west corner of this bounding box
  LatLng get northWest => LatLng(_north, _west);

  /// The south east corner of this bounding box
  LatLng get southEast => LatLng(_south, _east);

  /// The south west corner of this bounding box
  LatLng get southWest => LatLng(_south, _west);

  /// Return a scaled version of this bounding box, centered at the same point
  /// but with the size multiplied by [scale]
  BoundingBox operator *(double scale) {
    final width = _east - _west;
    final height = _north - _south;

    final extraWidth = width * (scale - 1);
    final extraHeight = height * (scale - 1);

    return BoundingBox._(
      north: _north + extraHeight / 2,
      south: _south - extraHeight / 2,
      east: _east + extraWidth / 2,
      west: _west - extraWidth / 2,
    );
  }
}
