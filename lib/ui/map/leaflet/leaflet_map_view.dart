import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/ui/map/leaflet/draw_handle_plugin.dart';
import 'package:snap_path/ui/map/leaflet/draw_line_plugin.dart';
import 'package:snap_path/ui/map/leaflet/distance_marker.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';

class LeafletMapView extends StatelessWidget {
  const LeafletMapView({
    Key key,
  }) : super(key: key);

  Map<int, LatLng> _getDistanceMarkers(BuildContext context) {
    var metric = context.select<AppState, bool>((state) => state.isMetric);
    var markers = context.select<PathDrawingState, List<LatLng>>(
      (pathDrawing) => pathDrawing.distanceMarkers(metric));

    return markers.asMap().map((key, value) => MapEntry(key + 1, value));
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: context.select<AppState, MapController>((state) => state.mapController),
      options: MapOptions(
        center: context.select<AppState, LatLng>((state) => state.userLocation)?? LatLng(42.349761, -71.078618),
        zoom: 14,
        plugins: [
          DrawLinePlugin(),
          DrawHandlePlugin(),
        ]
      ),
      layers: [
        TileLayerOptions(
          minZoom: 0,
          maxZoom: 22,
          urlTemplate: "https://api.mapbox.com/styles/v1/{username}/{id}/"
              "tiles/256/{z}/{x}/{y}?access_token={accessToken}",
          additionalOptions: {
            'accessToken': context.select<AppState, String>((state) => state.mapKey),
            'username': 'kjdemian',
            'id': 'ckah637x600q21imtjexsuvdt',
          },
        ),
        DrawLineLayerOptions(),
        MarkerLayerOptions(
          markers: [
            for (var entry in _getDistanceMarkers(context).entries)
              DistanceMarker(distance: entry.key, point: entry.value),
            if (context.select<AppState, LatLng>((state) => state.userLocation) != null)
              Marker(
                width: 20,
                height: 20,
                point: context.select<AppState, LatLng>((state) => state.userLocation),
                builder: (ctx) => Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3, color: Colors.white),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.blue.withOpacity(0.6))
                    ],
                  ),
                ),
              ),
          ],
              ),
        DrawHandleLayerOptions(),
        MarkerLayerOptions(
          markers: [
            HighlightedPointMarker(context.select<PathDrawingState, ElevationPoint>((state) => state.highlightedPoint)),
          ],
        ),
      ],
    );
  }
}