import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/ui/dialogs/share_dialog.dart';

/// The buttons to control map interaction and drawing
class MapControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<AppState, bool>(
      selector: (context, state) => state.controlsVisible,
      builder: (context, visible, child) => AnimatedOpacity(
        duration: Duration(milliseconds: 50),
        opacity: visible ? 1 : 0,
        child: child,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(blurRadius: 10, offset: Offset(0, 10), color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MapControlButton(
              enabled: context.select<AppState, bool>((s) => s.canGetLocation),
              icon: FeatherIcons.crosshair,
              onPressed: () => context.read<AppState>().goToUserLocation(),
            ),
            MapControlButton(
              enabled: context.select<PathDrawingState, bool>((s) => s.isNotEmpty),
              icon: FeatherIcons.trash,
              onPressed: () => context.read<PathDrawingState>().clear(),
            ),
            MapControlButton(
              enabled: context.select<PathDrawingState, bool>((s) => s.canUndo),
              icon: FeatherIcons.cornerUpLeft,
              onPressed: () => context.read<PathDrawingState>().undo(),
            ),
            MapControlButton(
              enabled: context.select<PathDrawingState, bool>((s) => s.isNotEmpty),
              icon: FeatherIcons.share,
              onPressed: () => showDialog(context: context, builder: (context) => ShareDialog()),
            ),
          ],
        ),
      ),
    );
  }
}

class MapControlButton extends StatelessWidget {
  final bool enabled;
  final IconData icon;
  final Function() onPressed;

  MapControlButton({
    Key key,
    this.icon,
    this.enabled,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: enabled ? 1 : 0.3,
      child: IconButton(
        icon: Icon(icon),
        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor,
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}