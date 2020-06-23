import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/models/path_drawing.dart';

class DrawHandleLayerOptions extends LayerOptions {}

class DrawHandlePlugin extends MapPlugin {
  LatLng _addOffsetToCoordinates(BuildContext context, MapState map, Offset globalOffset) {
    RenderBox renderBox = context.findRenderObject();
    var local = renderBox.globalToLocal(globalOffset);
    var dx = local.dx / renderBox.constraints.maxWidth;
    var dy = local.dy / renderBox.constraints.maxHeight;
    var lat = map.bounds.north + dy * (map.bounds.south - map.bounds.north);
    var lng = map.bounds.west + dx * (map.bounds.east - map.bounds.west);
    return LatLng(lat, lng);
  }

  @override
  Widget createLayer(LayerOptions layerOptions, MapState map, Stream<Null> stream) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) => Selector<PathDrawingState, List<LatLng>>(
        selector: (context, pathDrawing) => pathDrawing.coordinates,
        builder: (context, coordinates, child) {
          double handleSize = 20;
          CustomPoint<num> handlePos;
          if (coordinates.isNotEmpty) {
            handlePos = map.project(coordinates.last) - map.getPixelOrigin() - CustomPoint(handleSize / 2, handleSize / 2);
          }

          return Stack(
            children: <Widget>[
              if (coordinates.isNotEmpty)
                Positioned(
                  left: handlePos.x - handleSize,
                  top: handlePos.y - handleSize,
                  width: handleSize * 3,
                  height: handleSize * 3,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanUpdate: (details) => context.read<PathDrawingState>().addPoint(_addOffsetToCoordinates(context, map, details.globalPosition)),
                    onPanDown: (details) => context.read<PathDrawingState>().addPoint(_addOffsetToCoordinates(context, map, details.globalPosition)),
                    onPanStart: (details) => context.read<PathDrawingState>().addPoint(_addOffsetToCoordinates(context, map, details.globalPosition)),
                    onPanEnd: (_) => context.read<PathDrawingState>().endPath(),
                    onPanCancel: () => context.read<PathDrawingState>().endPath(),
                    child: Container(
                      margin: EdgeInsets.all(handleSize),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: handleSize / 6, color: AppColors.primary),
                        borderRadius: BorderRadius.circular(handleSize / 2),
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.2))
                        ]
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTapUp: (details) {
                  var coordinate = _addOffsetToCoordinates(context, map, details.globalPosition);
                  context.read<PathDrawingState>().addPoint(coordinate);
                  context.read<PathDrawingState>().endPath();
                  map.move(coordinate, map.zoom);
                },
              ),
            ],
          );
        }
      ),
    );
  }
  
  @override
  bool supportsLayer(LayerOptions layer) => layer is DrawHandleLayerOptions;
}
