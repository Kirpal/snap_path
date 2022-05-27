import 'dart:io';

import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:route/route.dart';
import 'package:snap_path/map/leaflet/leaflet.dart';
import 'package:snap_path/map/map.dart';
import 'package:snap_path/search/search.dart';
import 'package:snap_path/share_and_save/view/share_and_save_page.dart';

class MapPageView extends StatelessWidget {
  const MapPageView({required this.mapController});

  final MapController mapController;

  @override
  Widget build(BuildContext context) {
    final controlsVisible =
        context.select((MapBloc b) => b.state.controlsVisible);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        LeafletMapView(mapController: mapController),
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
                        onPressed: () async {
                          final searchResult = await Navigator.of(context)
                              .push(SearchPage.route());
                          if (searchResult != null) {
                            mapController.showBounds(searchResult.boundingBox);
                            context.read<MapBloc>().add(
                                MapEvent.searchResultSelected(searchResult));
                          }
                        },
                      ),
                    ),
                    FloatingMapControlButton(
                      icon: FeatherIcons.map,
                      enabled: true,
                      onPressed: () async {
                        final route = await Navigator.of(context).push<Route>(
                          MaterialPageRoute<Route>(
                            builder: (context) => ShareAndSavePage(),
                          ),
                        );

                        if (route != null) {
                          context
                              .read<DrawRouteBloc>()
                              .add(DrawRouteEvent.routeReplaced(route));
                          mapController.showBounds(
                            route.bounds,
                            padding: const EdgeInsets.all(24) +
                                const EdgeInsets.only(bottom: 120) +
                                MediaQuery.of(context).viewPadding,
                          );
                        }
                      },
                    ),
                    FloatingMapControlButton(
                      enabled:
                          context.select((MapBloc b) => b.state.canGetLocation),
                      icon: Platform.isIOS
                          ? FeatherIcons.navigation
                          : FeatherIcons.crosshair,
                      onPressed: () => context
                          .read<MapBloc>()
                          .add(const MapEvent.userLocationFocused()),
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
          child: MapControls(),
        ),
      ],
    );
  }
}
