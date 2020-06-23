import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:snap_path/colors.dart';

/// Marker to show distance along the path
class DistanceMarker extends Marker {
  DistanceMarker({@required LatLng point, @required num distance}) : super(
    width: 15,
    height: 15,
    point: point,
    builder: (context) => Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(distance.toString(), style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 8
      ),),
    ),
  );
}