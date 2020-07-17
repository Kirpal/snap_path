
import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:gpx/gpx.dart';
import 'package:latlong/latlong.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/utils/map_utils.dart';

class InitialRoute {
  /// Initialize the drawn route with any incoming intent (sharing, link, etc)
  static Future<void> initialize(PathDrawingState pathDrawingState, AppState appState) async {
    _handleNewPath(
      _processDynamicLink(await FirebaseDynamicLinks.instance.getInitialLink()),
      pathDrawingState,
      appState,
    );
    _handleNewPath(
      await _processSharedFiles(await ReceiveSharingIntent.getInitialMedia()),
      pathDrawingState,
      appState,
    );

    ReceiveSharingIntent.getMediaStream().listen((files) async {
      _handleNewPath(await _processSharedFiles(files), pathDrawingState, appState);
    });

    FirebaseDynamicLinks.instance.onLink(onSuccess: (data) {
      _handleNewPath(_processDynamicLink(data), pathDrawingState, appState);
      return Future.value(true);
    });
  }

  /// Given a new path, add it to the drawing state and focus it on the map
  static void _handleNewPath(List<LatLng> path, PathDrawingState pathDrawingState, AppState appState) {
    if (path?.isNotEmpty?? false) {
      pathDrawingState.clear();
      path.forEach((p) => pathDrawingState.addPoint(p));
      pathDrawingState.endPath();
      appState.moveToShow(
        bounds: pathDrawingState.bounds,
        padding: EdgeInsets.all(24) + EdgeInsets.only(bottom: 120),
      );
    }
  }

  /// Process the given dynamic link data (which can be null)
  static List<LatLng> _processDynamicLink(PendingDynamicLinkData data) {
    if (data?.link != null
      && data.link.pathSegments.length == 2
      && data.link.pathSegments.first == 'route') {
      return MapUtils.polylineToCoordinates(data.link.pathSegments[1]);
    }

    return [];
  }

  /// Process the given list of shared media files (which can be null or empty)
  static Future<List<LatLng>> _processSharedFiles(List<SharedMediaFile> files) async {
    if (files?.isNotEmpty?? false) {
      try {
        var xml = await File(files.first?.path).readAsString();
        var gpx = GpxReader().fromString(xml);
        if (gpx.trks.isNotEmpty && gpx.trks.first.trksegs.isNotEmpty) {
          return gpx.trks.first.trksegs.first.trkpts.map((w) => LatLng(w.lat, w.lon));
        }
      } catch (e) {
        print(e);
      }
    }

    return [];
  }
}