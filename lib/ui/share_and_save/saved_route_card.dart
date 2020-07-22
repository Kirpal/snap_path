import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/models/saved_route.dart';
import 'package:snap_path/repositories/map_repository.dart';
import 'package:snap_path/ui/bottom_sheet/bottom_sheet_header.dart';
import 'package:snap_path/utils/share_utils.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

typedef PopupMenuAction = void Function();

class SavedRouteCard extends StatelessWidget {
  final headerTextGroup = AutoSizeGroup();
  final SavedRouteData route;
  final int index;
  final bool metric;

  SavedRouteCard(this.index, this.route, this.metric);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 10),
              color: Colors.black.withOpacity(0.02))
        ],
      ),
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Theme.of(context).disabledColor.withOpacity(0.5)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            var width = (constraints.maxWidth *
                                    MediaQuery.of(context).devicePixelRatio)
                                .round();
                            var height = (constraints.maxHeight *
                                    MediaQuery.of(context).devicePixelRatio)
                                .round();
                            return Image.network(context
                                .watch<MapRepository>()
                                .getPreview(route.coordinates, width, height));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        children: <Widget>[
                          HeaderFigure(
                            group: headerTextGroup,
                            data: (metric
                                    ? route.distance.inKilometers
                                    : route.distance.inMiles)
                                .toStringAsFixed(2),
                            unit: metric ? 'kilometers' : 'miles',
                          ),
                          HeaderFigure(
                            group: headerTextGroup,
                            data: (metric
                                    ? route.elevationGain.inMeters
                                    : route.elevationGain.inFeet)
                                .round()
                                .toString(),
                            unit: metric ? 'meters' : 'feet',
                          ),
                        ],
                      ),
                    ),
                  ])),
          Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              splashColor: Theme.of(context).primaryColor.withOpacity(0.05),
              highlightColor: Theme.of(context).primaryColor.withOpacity(0.05),
              onTap: () {
                var pathDrawingState = context.read<PathDrawingState>();
                pathDrawingState.clear();
                route.coordinates.forEach((p) => pathDrawingState.addPoint(p));
                pathDrawingState.endPath();
                context.read<AppState>().moveToShow(
                      bounds: pathDrawingState.bounds,
                      padding: EdgeInsets.all(24) +
                          EdgeInsets.only(bottom: 120) +
                          MediaQuery.of(context).viewPadding,
                    );
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            bottom: 18,
            right: 0,
            child: PopupMenuButton<PopupMenuAction>(
              icon: Icon(FeatherIcons.moreVertical),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Delete'),
                  value: () => context.read<AppState>().deleteRoute(index),
                ),
                PopupMenuItem(
                    child: Text('Share'),
                    value: () async {
                      var shareLink =
                          await ShareUtils.generateShareLink(route.coordinates);
                      WcFlutterShare.share(
                          sharePopupTitle: 'Share Link',
                          text: shareLink,
                          mimeType: 'text/plain');
                    }),
              ],
              onSelected: (action) => action(),
            ),
          ),
        ],
      ),
    );
  }
}
