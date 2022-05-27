import 'package:bounding_box/bounding_box.dart';
import 'package:route/route.dart';
import 'package:snap_path/app/app.dart';

extension RoutePreviewX on Route {
  /// Construct a url for the preview image of this route
  String getPreviewUrl(int width, int height) {
    if (coordinates.isNotEmpty) {
      final bounds = BoundingBox.fromPoints(coordinates) * 1.4;

      final frame = [
        bounds.northWest,
        bounds.northEast,
        bounds.southEast,
        bounds.southWest
      ];

      final routeUrlString = Uri.encodeComponent(polyline);
      final frameUrlString = Uri.encodeComponent(frame.polyline);

      final pathWidth = ((width + height) / 120).round();

      return 'https://api.mapbox.com/styles/v1/kjdemian/ckah637x600q21imtjexsuvdt'
          '/static/path-${(pathWidth * 1.6).toStringAsFixed(2)}+fff($routeUrlString),'
          'path-$pathWidth+4d37b0($routeUrlString),'
          'path-0($frameUrlString)/auto/${width}x$height'
          '?access_token=$mapboxKey';
    }

    return '';
  }
}
