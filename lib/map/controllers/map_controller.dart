import 'package:bounding_box/bounding_box.dart';
import 'package:flutter/material.dart';
import 'package:route/route.dart';

abstract class MapController {
  /// A `Future` that completes once this controller can be used
  ///
  /// Using any functionality before [onReady] is complete has an undefined
  /// behavior and may throw
  Future<void> get onReady;

  /// Move the map view to show the given geographic area
  void showBounds(BoundingBox bounds, {EdgeInsets? padding});

  /// Move the map view to show the given center point at the given zoom level
  void moveTo(LatLng center, {double? zoom});
}
