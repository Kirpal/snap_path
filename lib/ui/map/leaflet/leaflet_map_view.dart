import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/models/search_result.dart';
import 'package:snap_path/ui/map/leaflet/draw_handle_plugin.dart';
import 'package:snap_path/ui/map/leaflet/draw_line_plugin.dart';
import 'package:snap_path/ui/map/leaflet/distance_marker.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/ui/map/leaflet/highlighted_point_marker.dart';
import 'package:snap_path/ui/map/leaflet/search_result_marker.dart';

class LeafletMapView extends StatelessWidget {
  LeafletMapView({
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
      mapController: context
          .select<AppState, MapController>((state) => state.mapController),
      options: MapOptions(
        center: context.select<AppState, LatLng>(
                (state) => state.userLocation?.location) ??
            LatLng(42.349761, -71.078618),
        zoom: 14,
        nePanBoundary: LatLng(90, 180),
        swPanBoundary: LatLng(-90, -180),
        minZoom: 0,
        maxZoom: 22,
        onTap: (point) {
          context.read<PathDrawingState>().addPoint(point);
          context.read<PathDrawingState>().endPath();
          var mapController = context.read<AppState>().mapController;
          mapController.move(point, mapController.zoom);
        },
      ),
      children: <Widget>[
        TileLayerWidget(
            options: TileLayerOptions(
          minZoom: 0,
          maxZoom: 22,
          urlTemplate: "https://api.mapbox.com/styles/v1/{username}/{id}/"
              "tiles/512/{z}/{x}/{y}?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                context.select<AppState, String>((state) => state.mapKey),
            'username': 'kjdemian',
            'id': 'ckah637x600q21imtjexsuvdt',
          },
        )),
        DrawLineLayer(),
        DrawHandleLayer(),
        MarkerLayerWidget(
          options: MarkerLayerOptions(
            markers: [
              for (var entry in _getDistanceMarkers(context).entries)
                DistanceMarker(distance: entry.key, point: entry.value),
              if (context.select<AppState, UserLocation>(
                      (state) => state.userLocation) !=
                  null)
                Marker(
                  width: 20,
                  height: 20,
                  point: context.select<AppState, LatLng>(
                      (state) => state.userLocation.location),
                  builder: (ctx) => Selector<AppState, bool>(
                      selector: (context, state) => state.userLocation.isOld,
                      builder: (context, isOld, _) {
                        return Container(
                          decoration: BoxDecoration(
                            color: isOld ? Colors.grey : Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 3, color: Colors.white),
                            boxShadow: [
                              if (!isOld)
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.blue.withOpacity(0.6))
                            ],
                          ),
                        );
                      }),
                ),
              SearchResultMarker(
                  context.select<AppState, SearchResult>(
                      (state) => state.selectedResult),
                  () => context.read<AppState>().selectResult(null)),
            ],
          ),
        ),
        MarkerLayerWidget(
          options: MarkerLayerOptions(
            markers: [
              HighlightedPointMarker(
                  context.select<PathDrawingState, ElevationPoint>(
                      (state) => state.highlightedPoint)),
            ],
          ),
        )
      ],
    );
  }
}
