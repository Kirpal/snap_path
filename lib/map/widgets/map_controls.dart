import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/map/map.dart';

/// The buttons to control map interaction and drawing
class MapControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (a, b) => a.controlsVisible != b.controlsVisible,
      builder: (context, state) => AnimatedOpacity(
        duration: const Duration(milliseconds: 50),
        opacity: state.controlsVisible ? 1 : 0,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 10),
                color: Colors.black.withOpacity(0.1),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MapControlButton(
                enabled: context.select<DrawRouteBloc, bool>((b) => b.canUndo),
                icon: FeatherIcons.cornerUpLeft,
                onPressed: () => context.read<DrawRouteBloc>().undo(),
              ),
              MapControlButton(
                enabled: context.select<DrawRouteBloc, bool>(
                  (b) => b.state.route.coordinates.isNotEmpty,
                ),
                icon: FeatherIcons.trash,
                onPressed: () => context
                    .read<DrawRouteBloc>()
                    .add(const DrawRouteEvent.cleared()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
