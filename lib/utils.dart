library utils;

import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart' as material;
import 'package:gpx/gpx.dart';
import 'package:latlong/latlong.dart';
import 'package:polyline/polyline.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

/// Launch a share dialog for a GPX file with the given path coordinates
Future<void> shareGpx(List<ElevationPoint> points) async {
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
Future<String> generateShareLink(List<LatLng> coordinates) async {
  var linkParameters = DynamicLinkParameters(
    uriPrefix: 'https://snappath.page.link',
    link: Uri(
      scheme: 'https',
      host: 'snappath.kirp.al',
      pathSegments: [
        'route',
        Polyline.Encode(decodedCoords: coordinates.map((l) => [l.latitude, l.longitude]).toList()).encodedString
      ],
    ),
    androidParameters: AndroidParameters(packageName: 'com.kirpal.snappath'),
    iosParameters: IosParameters(bundleId: 'com.kirpal.snappath', appStoreId: '1520117146'),
  );

  return (await linkParameters.buildShortLink()).shortUrl.toString();
}

/// Create a color for the Charts library from the given material color
charts.Color chartColorFrom(material.Color materialColor) => charts.Color(
  r: materialColor.red,
  g: materialColor.green,
  b: materialColor.blue,
  a: materialColor.alpha,
);