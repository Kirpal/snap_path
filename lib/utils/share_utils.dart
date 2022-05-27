import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:gpx/gpx.dart';
import 'package:route/route.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

/// Utilities for sharing
class ShareUtils {
  static final Map<String, String> _shareLinkCache = {};

  /// Launch a share dialog for a GPX file with the given path coordinates
  static Future<void> shareGpx(List<RoutePoint> points) async {
    final gpx = Gpx()
      ..creator = 'Snap Path'
      ..trks = [
        Trk(
          name: 'Snap Path',
          trksegs: [
            Trkseg(
                trkpts: points
                    .map((l) => Wpt(
                          lat: l.latitude,
                          lon: l.longitude,
                          ele: l.elevation.inMeters,
                        ))
                    .toList()),
          ],
        ),
      ];

    return WcFlutterShare.share(
        sharePopupTitle: 'Share GPX',
        fileName: 'snappath.gpx',
        bytesOfFile: utf8.encode(GpxWriter().asString(gpx, pretty: true)),
        mimeType: 'application/gpx+xml');
  }

  /// Generate a share link for the given path coordinates
  static Future<String> generateShareLink(Route route) async {
    if (_shareLinkCache.containsKey(route.polyline)) {
      return _shareLinkCache[route.polyline]!;
    } else {
      final linkParameters = DynamicLinkParameters(
        uriPrefix: 'https://snappath.page.link',
        link: Uri(
          scheme: 'https',
          host: 'snappath.kirp.al',
          pathSegments: [
            'route',
            route.polyline,
          ],
        ),
        androidParameters:
            AndroidParameters(packageName: 'com.kirpal.snappath'),
        iosParameters: IosParameters(
            bundleId: 'com.kirpal.snappath', appStoreId: '1520117146'),
      );

      final shortLink =
          (await linkParameters.buildShortLink()).shortUrl.toString();

      _shareLinkCache[route.polyline] = shortLink;

      return shortLink;
    }
  }
}
