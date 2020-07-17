import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:gpx/gpx.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/utils/map_utils.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

/// Utilities for sharing
class ShareUtils {
  static final Map<String, String> _shareLinkCache = {};

  /// Launch a share dialog for a GPX file with the given path coordinates
  static Future<void> shareGpx(List<ElevationPoint> points) async {
    var gpx = Gpx()
      ..creator = 'Snap Path'
      ..trks = [
        Trk(
          name: 'Snap Path',
          trksegs: [
            Trkseg(
              trkpts: points.map((l) => Wpt(
                lat: l.coordinate.latitude,
                lon: l.coordinate.longitude,
                ele: l.elevation.inMeters,
              )).toList()
            ),
          ],
        ),
      ];

    return WcFlutterShare.share(
      sharePopupTitle: 'Share GPX',
      fileName: 'snappath.gpx',
      bytesOfFile: utf8.encode(GpxWriter().asString(gpx, pretty: true)),
      mimeType: 'application/gpx+xml'
    );
  }

  /// Generate a share link for the given path coordinates
  static Future<String> generateShareLink(List<LatLng> coordinates) async {
    var polyline = MapUtils.coordinatesToPolyline(coordinates);

    if (_shareLinkCache.containsKey(polyline)) {
      return _shareLinkCache[polyline];
    } else {
      var linkParameters = DynamicLinkParameters(
        uriPrefix: 'https://snappath.page.link',
        link: Uri(
          scheme: 'https',
          host: 'snappath.kirp.al',
          pathSegments: [
            'route',
            polyline,
          ],
        ),
        androidParameters: AndroidParameters(packageName: 'com.kirpal.snappath'),
        iosParameters: IosParameters(bundleId: 'com.kirpal.snappath', appStoreId: '1520117146'),
      );

      var shortLink = (await linkParameters.buildShortLink()).shortUrl.toString();

      _shareLinkCache[polyline] = shortLink;

      return shortLink;
    }
  }
}