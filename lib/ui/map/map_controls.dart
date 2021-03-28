import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/ui/map/map_control_button.dart';

/// The buttons to control map interaction and drawing
class MapControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<AppState, bool>(
      selector: (context, state) => state.controlsVisible,
      builder: (context, visible, child) => AnimatedOpacity(
        duration: const Duration(milliseconds: 50),
        opacity: visible ? 1 : 0,
        child: child,
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 10),
                color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MapControlButton(
              enabled: context.select<PathDrawingState, bool>((s) => s.canUndo),
              icon: FeatherIcons.cornerUpLeft,
              onPressed: () => context.read<PathDrawingState>().undo(),
            ),
            MapControlButton(
              enabled:
                  context.select<PathDrawingState, bool>((s) => s.isNotEmpty),
              icon: FeatherIcons.trash,
              onPressed: () => context.read<PathDrawingState>().clear(),
            ),
          ],
        ),
      ),
    );
  }
}
