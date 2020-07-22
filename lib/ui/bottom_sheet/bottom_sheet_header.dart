import 'package:auto_size_text/auto_size_text.dart';
import 'package:distance/distance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';

/// The header of the bottom sheet showing distance, elevation gain, and time
class BottomSheetHeader extends StatelessWidget {
  final headerTextGroup = AutoSizeGroup();
  final MediaQueryData mediaQuery;

  BottomSheetHeader(this.mediaQuery);

  @override
  Widget build(BuildContext context) {
    return Selector<AppState, bool>(
        selector: (context, state) => state.isMetric,
        builder: (context, metric, child) {
          return Container(
            padding: EdgeInsets.all(8) +
                EdgeInsets.only(bottom: mediaQuery.padding.bottom),
            height: 120 + mediaQuery.padding.bottom,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Selector<PathDrawingState, Distance>(
                          selector: (context, state) => state.distance,
                          builder: (context, distance, child) => HeaderFigure(
                                group: headerTextGroup,
                                name: 'Distance',
                                data: (metric
                                        ? distance.inKilometers
                                        : distance.inMiles)
                                    .toStringAsFixed(2),
                                unit: metric ? 'kilometers' : 'miles',
                              )),
                      HeaderDivider(),
                      Selector<PathDrawingState, Distance>(
                        selector: (context, state) => state.elevation.gain,
                        builder: (context, gain, child) => HeaderFigure(
                          group: headerTextGroup,
                          name: 'Elevation Gain',
                          data: (metric ? gain.inMeters : gain.inFeet)
                              .round()
                              .toString(),
                          unit: metric ? 'meters' : 'feet',
                        ),
                      ),
                      HeaderDivider(),
                      Selector2<AppState, PathDrawingState, Duration>(
                        selector: (context, state, pathDrawing) => Duration(
                            seconds: (pathDrawing.distance.inMeters /
                                    state.metersPerSecond)
                                .round()),
                        builder: (context, duration, child) => HeaderFigure(
                            group: headerTextGroup,
                            name: 'Time',
                            data: duration.inMinutes.toString(),
                            unit: 'minutes'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

/// The big datapoints displayed in the bottom sheet header
class HeaderFigure extends StatelessWidget {
  final AutoSizeGroup group;
  final String name;
  final String data;
  final String unit;

  HeaderFigure({this.group, this.name, this.data, this.unit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (name?.isNotEmpty ?? false)
              AutoSizeText(
                name,
                maxLines: 1,
              ),
            if (data?.isNotEmpty ?? false)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: AutoSizeText(
                  data,
                  group: group,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
            if (unit?.isNotEmpty ?? false)
              AutoSizeText(
                unit,
                maxLines: 1,
              ),
          ],
        ),
      ),
    );
  }
}

/// The line dividing sections of the header
class HeaderDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: Theme.of(context).disabledColor,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
    );
  }
}
