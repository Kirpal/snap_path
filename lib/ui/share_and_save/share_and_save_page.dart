import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong/latlong.dart' show LatLng;
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/models/saved_route.dart';
import 'package:snap_path/repositories/map_repository.dart';
import 'package:snap_path/ui/dialogs/settings_dialog.dart';
import 'package:snap_path/ui/share_and_save/saved_route_card.dart';
import 'package:snap_path/ui/widgets/copy_field.dart';
import 'package:snap_path/utils/share_utils.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class ShareAndSavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: true,
            pinned: true,
            stretch: false,
            backgroundColor: Theme.of(context).backgroundColor,
            actions: <Widget>[
              IconButton(
                icon: const Icon(FeatherIcons.settings),
                color: Theme.of(context).accentColor.withOpacity(0.4),
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => SettingsDialog());
                },
              ),
            ],
            leading: IconButton(
              icon: const Icon(FeatherIcons.arrowLeft),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          if (context.select<PathDrawingState, bool>(
              (state) => state.coordinates.length > 1))
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24)
                  .copyWith(bottom: 48),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Selector<PathDrawingState, List<LatLng>>(
                      selector: (context, state) => state.coordinates,
                      builder: (context, coordinates, child) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AspectRatio(
                              aspectRatio: 1.2,
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                final width = constraints.maxWidth *
                                    MediaQuery.of(context).devicePixelRatio;
                                return Image.network(context
                                    .watch<MapRepository>()
                                    .getPreview(coordinates, width.round(),
                                        (width / 1.2).round()));
                              }),
                            ),
                          ),
                        );
                      }),
                  Selector<PathDrawingState, List<LatLng>>(
                    selector: (context, state) => state.coordinates,
                    builder: (context, coordinates, child) =>
                        FutureBuilder<String>(
                            future: ShareUtils.generateShareLink(coordinates),
                            builder: (context, snapshot) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                      flex: 20,
                                      child: CopyField(
                                        text: snapshot.data,
                                      )),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    visualDensity: VisualDensity.compact,
                                    iconSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    icon: const Icon(
                                      FeatherIcons.share2,
                                    ),
                                    onPressed: snapshot.hasData
                                        ? () {
                                            WcFlutterShare.share(
                                                sharePopupTitle: 'Share Link',
                                                text: snapshot.data,
                                                mimeType: 'text/plain');
                                          }
                                        : null,
                                  ),
                                ],
                              );
                            }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: OutlineButton(
                      color: Theme.of(context).primaryColor,
                      highlightedBorderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                      child: const Text('Export GPX'),
                      onPressed: () => ShareUtils.shareGpx(context
                          .read<PathDrawingState>()
                          .elevation
                          .unfiltered),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      highlightColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).backgroundColor,
                      child: const Text('Save Route'),
                      onPressed: () {
                        final pathDrawingState =
                            context.read<PathDrawingState>();

                        context.read<AppState>().saveRoute(
                            pathDrawingState.coordinates,
                            pathDrawingState.elevation.gain);
                      },
                    ),
                  ),
                ]),
              ),
            ),
          const SliverToBoxAdapter(
            child: Text('Saved Routes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            sliver: Selector<AppState, bool>(
              selector: (context, state) => state.isMetric,
              builder: (context, metric, _) {
                return Selector<AppState, List<SavedRouteData>>(
                  selector: (context, state) => state.savedRoutes,
                  builder: (context, savedRoutes, child) => savedRoutes
                          .isNotEmpty
                      ? SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.75,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => SavedRouteCard(
                                index, savedRoutes[index], metric),
                            childCount: savedRoutes.length,
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Opacity(
                                opacity: 0.8,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: SvgPicture.asset(
                                      'assets/illustrations/map_illustration.svg'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Text(
                                'No routes found',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ]),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
