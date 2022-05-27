import 'package:flutter/material.dart';
import 'package:location_client/location_client.dart';
import 'package:snap_path/map/leaflet/leaflet.dart';

class UserLocationMarker extends OptionalMarker {
  UserLocationMarker({required UserLocation? userLocation})
      : super(
          width: 20,
          height: 20,
          point: userLocation?.location,
          builder: (ctx) => Container(
            decoration: BoxDecoration(
              color: userLocation!.isOld ? Colors.grey : Colors.blue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.white),
              boxShadow: [
                if (!userLocation.isOld)
                  BoxShadow(blurRadius: 5, color: Colors.blue.withOpacity(0.6))
              ],
            ),
          ),
        );
}
