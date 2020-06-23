import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/map/line_painter.dart';
import 'package:snap_path/models/path_drawing.dart';

class DrawLineLayerOptions extends LayerOptions {}

class DrawLinePlugin extends MapPlugin {
  @override
  Widget createLayer(LayerOptions layerOptions, MapState map, Stream<Null> stream) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) => Selector<PathDrawingState, List<LatLng>>(
        selector: (context, pathDrawing) => pathDrawing.coordinates,
        builder: (context, coordinates, child) {
          return IgnorePointer(
            child: CustomPaint(
              size: Size.infinite,
              painter: LinePainter(
                strokeWidth: 8,
                points: coordinates.map((point) {
                  var pos = map.project(point) - map.getPixelOrigin();

                  return Offset(pos.x, pos.y);
                }).toList(),
              ),
            ),
          );
        }
      ),
    );
  }
  
  @override
  bool supportsLayer(LayerOptions layer) => layer is DrawLineLayerOptions;
}
