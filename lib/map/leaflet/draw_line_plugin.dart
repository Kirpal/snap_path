import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/map/map.dart' hide MapState;

class DrawLineLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapState = MapState.maybeOf(context)!;
    final route = context.select((DrawRouteBloc b) => b.state.route);

    return StreamBuilder<Null>(
      stream: mapState.onMoved,
      builder: (context, _) => IgnorePointer(
        child: Stack(
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: LinePainter(
                strokeWidth: 8,
                points: route.coordinates.map((point) {
                  final pos =
                      mapState.project(point) - mapState.getPixelOrigin();

                  return Offset(pos.x.toDouble(), pos.y.toDouble());
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
