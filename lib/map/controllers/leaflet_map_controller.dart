import 'package:bounding_box/bounding_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart' as leaflet show MapController;
import 'package:flutter_map/plugin_api.dart' hide MapController;
import 'package:latlong2/latlong.dart';
import 'package:snap_path/map/map.dart';

extension on BoundingBox {
  LatLngBounds get bbox => LatLngBounds(northWest, southEast);
}

class LeafletMapController extends MapController {
  LeafletMapController({leaflet.MapController? mapController})
      : _mapController = mapController ?? leaflet.MapController();

  final leaflet.MapController _mapController;

  /// The underlying controller which handles functionality
  leaflet.MapController get controller => _mapController;

  @override
  Future<void> get onReady => _mapController.onReady;

  @override
  void showBounds(BoundingBox bounds, {EdgeInsets? padding}) =>
      _mapController.fitBounds(
        bounds.bbox,
        options: FitBoundsOptions(padding: padding ?? EdgeInsets.zero),
      );

  @override
  void moveTo(LatLng center, {double? zoom}) => _mapController.move(
        center,
        zoom ?? _mapController.zoom,
      );
}
