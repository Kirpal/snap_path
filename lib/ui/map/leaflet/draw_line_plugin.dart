import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/map/line_painter.dart';
import 'package:snap_path/models/path_drawing.dart';

class DrawLineLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<PathDrawingState, List<LatLng>>(
      selector: (context, pathDrawing) => pathDrawing.coordinates,
      builder: (context, coordinates, _) => StreamBuilder<Null>(
        stream: MapState.of(context).onMoved,
        builder: (context, _) => IgnorePointer(
          child: CustomPaint(
            size: Size.infinite,
            painter: LinePainter(
              strokeWidth: 8,
              points: coordinates.map((point) {
                final pos = MapState.of(context).project(point) -
                    MapState.of(context).getPixelOrigin();

                return Offset(pos.x, pos.y);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
