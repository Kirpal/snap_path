import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/map/leaflet/leaflet_map_view.dart';
import 'package:snap_path/ui/map/map_controls.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/ui/dialogs/settings_dialog.dart';
import 'package:snap_path/ui/dialogs/intro_dialog.dart';

class MapWrapper extends StatefulWidget {
  @override
  _MapWrapperState createState() => _MapWrapperState();
}

class _MapWrapperState extends State<MapWrapper> {
  @override
  void initState() {
    super.initState();

    // Show the intro dialog the first time someone opens the app
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (context.read<AppState>().showIntro) {
        await showDialog(context: context, child: IntroDialog());
        context.read<AppState>().goToUserLocation(ask: true);
        context.read<AppState>().updatePreference('showIntro', false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        LeafletMapView(),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(FeatherIcons.settings),
              color: Colors.black.withOpacity(0.4),
              onPressed: () {
                showDialog(context: context, builder: (context) => SettingsDialog());
              },
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: MediaQuery.of(context).size.aspectRatio > 1.5 ? 0 : 120 + MediaQuery.of(context).viewPadding.bottom,
          child: MapControls()
        )
      ],
    );
  }
}
