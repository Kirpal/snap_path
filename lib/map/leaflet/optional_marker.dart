import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:route/route.dart';

class OptionalMarker extends Marker {
  OptionalMarker({
    required WidgetBuilder builder,
    required LatLng? point,
    required double width,
    required double height,
    AnchorPos? anchorPos,
  }) : super(
          builder: (context) =>
              point != null ? builder(context) : const SizedBox(),
          point: point ?? LatLng(0, 0),
          width: width,
          height: height,
          anchorPos: anchorPos,
        );
}
