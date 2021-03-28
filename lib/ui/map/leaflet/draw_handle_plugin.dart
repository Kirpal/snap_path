import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/models/path_drawing.dart';

class DrawHandleLayer extends StatelessWidget {
  final double handleSize = 20;

  LatLng _addPointFromOffset(BuildContext context, Offset globalOffset) {
    final mapState = MapState.of(context);
    final RenderBox renderBox = context.findRenderObject();
    final local = renderBox.globalToLocal(globalOffset);
    final dx = local.dx / renderBox.constraints.maxWidth;
    final dy = local.dy / renderBox.constraints.maxHeight;
    final lat = mapState.bounds.north +
        dy * (mapState.bounds.south - mapState.bounds.north);
    final lng = mapState.bounds.west +
        dx * (mapState.bounds.east - mapState.bounds.west);
    final newPoint = LatLng(lat, lng);

    context.read<PathDrawingState>().addPoint(newPoint);

    return newPoint;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PathDrawingState, List<LatLng>>(
      selector: (context, pathDrawing) => pathDrawing.coordinates,
      builder: (context, coordinates, child) => StreamBuilder<Null>(
        stream: MapState.of(context).onMoved,
        builder: (context, _) {
          CustomPoint<num> handlePos;
          if (coordinates.isNotEmpty) {
            handlePos = MapState.of(context).project(coordinates.last) -
                MapState.of(context).getPixelOrigin() -
                CustomPoint(handleSize / 2, handleSize / 2);
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
                    onPanUpdate: (details) =>
                        _addPointFromOffset(context, details.globalPosition),
                    onPanDown: (details) =>
                        _addPointFromOffset(context, details.globalPosition),
                    onPanStart: (details) =>
                        _addPointFromOffset(context, details.globalPosition),
                    onPanEnd: (_) => context.read<PathDrawingState>().endPath(),
                    onPanCancel: () =>
                        context.read<PathDrawingState>().endPath(),
                    child: child,
                  ),
                ),
            ],
          );
        },
      ),
      child: Container(
        margin: EdgeInsets.all(handleSize),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: handleSize / 6, color: AppColors.primary),
            borderRadius: BorderRadius.circular(handleSize / 2),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.2))
            ]),
      ),
    );
  }
}
