import 'package:charts_flutter/flutter.dart' as charts;
import 'package:distance/distance.dart';
import 'package:flutter/material.dart' as material;

/// Create a color for the Charts library from the given material color
charts.Color chartColorFrom(material.Color materialColor) => charts.Color(
  r: materialColor.red,
  g: materialColor.green,
  b: materialColor.blue,
  a: materialColor.alpha,
);

/// Convenience for creating a [Distance] from meters
extension ToDistance on num {
  Distance toDistance() {
    return Distance(micrometers: (this * Distance.micrometersInMeter).round());
  }
}