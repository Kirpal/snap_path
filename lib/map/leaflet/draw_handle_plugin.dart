import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'package:route/route.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/map/map.dart' hide MapState;

const _origin = CustomPoint(0, 0);

class DrawHandleLayer extends StatelessWidget {
  final double handleSize = 20;

  LatLng _addPointFromOffset(BuildContext context, Offset globalOffset) {
    final mapState = MapState.maybeOf(context);
    final renderBox = context.findRenderObject()! as RenderBox;
    final local = renderBox.globalToLocal(globalOffset);
    final bounds = mapState?.bounds ?? LatLngBounds();
    final dx = local.dx / renderBox.constraints.maxWidth;
    final dy = local.dy / renderBox.constraints.maxHeight;
    final lat = bounds.north + dy * (bounds.south - bounds.north);
    final lng = bounds.west + dx * (bounds.east - bounds.west);
    final newPoint = LatLng(lat, lng);

    context.read<DrawRouteBloc>().add(DrawRouteEvent.pointAdded(newPoint));

    return newPoint;
  }

  @override
  Widget build(BuildContext context) {
    final mapState = MapState.maybeOf(context);
    final route = context.select((DrawRouteBloc b) => b.state.route);

    return StreamBuilder<Null>(
      stream: mapState?.onMoved,
      builder: (context, _) {
        var handlePos = CustomPoint(handleSize / 2, handleSize / 2) * -1;
        if (route.coordinates.isNotEmpty) {
          handlePos += mapState?.project(route.coordinates.last) ?? _origin;
          handlePos -= mapState?.getPixelOrigin() ?? _origin;
        }

        return Stack(
          children: <Widget>[
            if (route.coordinates.isNotEmpty)
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
                  onPanEnd: (_) => context
                      .read<DrawRouteBloc>()
                      .add(const DrawRouteEvent.ended()),
                  onPanCancel: () => context
                      .read<DrawRouteBloc>()
                      .add(const DrawRouteEvent.ended()),
                  child: Container(
                    margin: EdgeInsets.all(handleSize),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: handleSize / 6,
                        color: AppColors.primary,
                      ),
                      borderRadius: BorderRadius.circular(handleSize / 2),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
