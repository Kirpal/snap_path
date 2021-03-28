import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/map/leaflet/leaflet_map_view.dart';
import 'package:snap_path/ui/map/map_control_button.dart';
import 'package:snap_path/ui/map/map_controls.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/ui/dialogs/intro_dialog.dart';
import 'package:snap_path/ui/share_and_save/share_and_save_page.dart';
import 'package:snap_path/ui/search/search_page.dart';

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
        await showDialog(context: context, builder: (_) => IntroDialog());
        context.read<AppState>().goToUserLocation(ask: true);
        context.read<AppState>().updatePreference('showIntro', false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AppState, bool>(
        selector: (context, state) => state.controlsVisible,
        builder: (context, controlsVisible, _) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              LeafletMapView(),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                top: 0,
                right: controlsVisible ? 0 : -70,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: controlsVisible ? 1 : 0,
                  child: SafeArea(
                    bottom: false,
                    left: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: 'SEARCH_ICON',
                            child: FloatingMapControlButton(
                              icon: FeatherIcons.search,
                              enabled: true,
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) => SearchPage())),
                            ),
                          ),
                          FloatingMapControlButton(
                            icon: FeatherIcons.map,
                            enabled: true,
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (context) => ShareAndSavePage())),
                          ),
                          FloatingMapControlButton(
                            enabled: context.select<AppState, bool>(
                                (s) => s.canGetLocation),
                            icon: Platform.isIOS
                                ? FeatherIcons.navigation
                                : FeatherIcons.crosshair,
                            onPressed: () =>
                                context.read<AppState>().goToUserLocation(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: MediaQuery.of(context).size.width > 720 ||
                          MediaQuery.of(context).size.aspectRatio > 1.5
                      ? 0
                      : 120 + MediaQuery.of(context).padding.bottom,
                  child: MapControls())
            ],
          );
        });
  }
}
