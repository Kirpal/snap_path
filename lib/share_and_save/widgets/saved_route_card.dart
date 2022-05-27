import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:route/route.dart';
import 'package:snap_path/app/preferences/app_preferences.dart';
import 'package:snap_path/share_and_save/share_and_save.dart';
import 'package:snap_path/snap_path_ui/snap_path_ui.dart';
import 'package:snap_path/utils/share_utils.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

typedef PopupMenuAction = void Function();

class SavedRouteCard extends StatelessWidget {
  SavedRouteCard({
    required this.index,
    required this.route,
    required this.onRouteDeleted,
  });

  final headerTextGroup = AutoSizeGroup();
  final Route route;
  final int index;
  final VoidCallback onRouteDeleted;

  @override
  Widget build(BuildContext context) {
    final isMetric = context.select((AppPreferences p) => p.isMetric.value);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AspectRatio(
        aspectRatio: 3,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 10),
                color: Colors.black.withOpacity(0.02),
              )
            ],
          ),
          child: InkWell(
            splashColor: Theme.of(context).primaryColor.withOpacity(0.05),
            highlightColor: Theme.of(context).primaryColor.withOpacity(0.05),
            onTap: () => Navigator.of(context).pop(route),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final width = (constraints.maxWidth *
                                  MediaQuery.of(context).devicePixelRatio)
                              .round();
                          final height = (constraints.maxHeight *
                                  MediaQuery.of(context).devicePixelRatio)
                              .round();
                          return Image.network(
                            route.getPreviewUrl(width, height),
                            width: width.toDouble(),
                            height: height.toDouble(),
                          );
                        },
                      ),
                    ),
                  ),
                  const Gap(24),
                  Expanded(
                    child: DataFigure(
                      group: headerTextGroup,
                      data: (isMetric
                              ? route.distance.inKilometers
                              : route.distance.inMiles)
                          .toStringAsFixed(2),
                      unit: isMetric ? 'kilometers' : 'miles',
                    ),
                  ),
                  Expanded(
                    child: DataFigure(
                      group: headerTextGroup,
                      data: (isMetric
                              ? route.elevationGain.inMeters
                              : route.elevationGain.inFeet)
                          .round()
                          .toString(),
                      unit: isMetric ? 'meters' : 'feet',
                    ),
                  ),
                  PopupMenuButton<PopupMenuAction>(
                    icon: const Icon(FeatherIcons.moreVertical),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Delete'),
                        value: onRouteDeleted,
                      ),
                      PopupMenuItem(
                        child: const Text('Share'),
                        value: () async {
                          final shareLink =
                              await ShareUtils.generateShareLink(route);
                          await WcFlutterShare.share(
                            sharePopupTitle: 'Share Link',
                            text: shareLink,
                            mimeType: 'text/plain',
                          );
                        },
                      ),
                    ],
                    onSelected: (action) => action(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
