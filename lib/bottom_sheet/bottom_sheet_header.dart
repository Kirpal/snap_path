import 'package:auto_size_text/auto_size_text.dart';
import 'package:distance/distance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/app/app.dart';
import 'package:snap_path/map/map.dart';
import 'package:snap_path/snap_path_ui/snap_path_ui.dart';

/// The header of the bottom sheet showing distance, elevation gain, and time
class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader(this.mediaQuery);

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8) +
          EdgeInsets.only(bottom: mediaQuery.padding.bottom),
      height: 120 + mediaQuery.padding.bottom,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: HeaderStats(),
          ),
        ],
      ),
    );
  }
}

class HeaderStats extends StatelessWidget {
  HeaderStats({
    Key? key,
  }) : super(key: key);

  final headerTextGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final metric = context.select((AppPreferences p) => p.isMetric.value);
    final metersPerSecond =
        context.select((AppPreferences p) => p.metersPerSecond.value);
    final distance =
        context.select((DrawRouteBloc b) => b.state.route.distance);
    final duration =
        Duration(seconds: (distance.inMeters / metersPerSecond).round());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: DataFigure(
            group: headerTextGroup,
            name: 'Distance',
            data: (metric ? distance.inKilometers : distance.inMiles)
                .toStringAsFixed(2),
            unit: metric ? 'kilometers' : 'miles',
          ),
        ),
        HeaderDivider(),
        Selector<DrawRouteBloc, Distance>(
          selector: (context, b) => b.state.route.elevationGain,
          builder: (context, gain, child) => Expanded(
            child: DataFigure(
              group: headerTextGroup,
              name: 'Elevation Gain',
              data: (metric ? gain.inMeters : gain.inFeet).round().toString(),
              unit: metric ? 'meters' : 'feet',
            ),
          ),
        ),
        HeaderDivider(),
        Expanded(
          child: DataFigure(
            group: headerTextGroup,
            name: 'Time',
            data: duration.inMinutes.toString(),
            unit: 'minutes',
          ),
        ),
      ],
    );
  }
}

class HeaderDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      thickness: 1,
      color: Theme.of(context).disabledColor,
      width: 20,
      indent: 30,
      endIndent: 30,
    );
  }
}
