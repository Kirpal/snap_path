import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent, MapController;
import 'package:flutter_map/plugin_api.dart'
    hide MapState, MapEvent, MapController;
import 'package:provider/provider.dart';
import 'package:route/route.dart';
import 'package:snap_path/app/app.dart';
import 'package:snap_path/map/leaflet/leaflet.dart';
import 'package:snap_path/map/map.dart';

class LeafletMapView extends StatelessWidget {
  const LeafletMapView({required MapController mapController})
      : _mapController = mapController;

  final MapController _mapController;

  Map<int, LatLng> _getDistanceMarkers(BuildContext context) {
    final metric = context.select<AppPreferences, bool>(
      (preferences) => preferences.isMetric.value,
    );
    final markers = context.select<DrawRouteBloc, List<RoutePoint>>(
      (b) => b.state.route.distanceMarkers(metric),
    );

    return markers.asMap().map((key, value) => MapEntry(key + 1, value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) async {
        await _mapController.onReady;
        if (state.searchResult != null) {
          _mapController.showBounds(
            state.searchResult!.boundingBox,
            padding: const EdgeInsets.all(20),
          );
        }

        if (state.userLocationFocused && state.userLocation != null) {
          _mapController.moveTo(state.userLocation!.location, zoom: 14);
        }
      },
      child: FlutterMap(
        mapController: (_mapController as LeafletMapController).controller,
        options: MapOptions(
          center: context.select<MapBloc, LatLng?>(
                (b) => b.state.userLocation?.location,
              ) ??
              LatLng(42.349761, -71.078618),
          zoom: 14,
          nePanBoundary: LatLng(90, 180),
          swPanBoundary: LatLng(-90, -180),
          minZoom: 0,
          maxZoom: 22,
          onTap: (point) {
            context.read<DrawRouteBloc>().add(DrawRouteEvent.pointAdded(point));
            context.read<DrawRouteBloc>().add(const DrawRouteEvent.ended());
            _mapController.moveTo(point);
          },
          onPositionChanged: (_, userInteraction) {
            if (userInteraction) {
              context
                  .read<MapBloc>()
                  .add(const MapEvent.userLocationUnfocused());
            }
          },
        ),
        children: <Widget>[
          TileLayerWidget(
              options: TileLayerOptions(
            minZoom: 0,
            maxZoom: 22,
            urlTemplate: 'https://api.mapbox.com/styles/v1/{username}/{id}/'
                'tiles/512/{z}/{x}/{y}?access_token={accessToken}',
            additionalOptions: {
              'accessToken': mapboxKey,
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
                UserLocationMarker(
                  userLocation:
                      context.select((MapBloc b) => b.state.userLocation),
                ),
                SearchResultMarker(
                  searchResult:
                      context.select((MapBloc b) => b.state.searchResult),
                  onClose: () => context
                      .read<MapBloc>()
                      .add(const MapEvent.searchResultUnselected()),
                ),
              ],
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                HighlightedPointMarker(
                  context.select<MapBloc, RoutePoint?>(
                      (b) => b.state.highlightedPoint),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
