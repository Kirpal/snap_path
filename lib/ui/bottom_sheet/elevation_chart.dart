import 'package:charts_flutter/flutter.dart';
import 'package:distance/distance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/bottom_sheet/elevation_chart_placeholder.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:snap_path/utils.dart';

class ElevationChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<AppState, bool>(
      selector: (context, state) => state.isMetric,
      builder: (context, metric, child) {
        return Selector<PathDrawingState, ElevationData>(
          selector: (context, pathDrawing) => pathDrawing.elevation,
          builder: (context, elevation, child) => elevation.hasData ? LineChart(
            <Series<ElevationPoint, double>>[
              Series<ElevationPoint, double>(
                id: 'elevationChart',
                data: elevation.filtered,
                domainFn: (point, _) {
                  var distance = Distance(micrometers: (point.distance * Distance.micrometersInMeter).round());
                  if (metric) {
                    return distance.inKilometers;
                  } else {
                    return distance.inMiles;
                  }
                },
                measureFn: (point, _)  {
                  var distance = Distance(micrometers: (point.elevation * Distance.micrometersInMeter).round());
                  if (metric) {
                    return distance.inMeters;
                  } else {
                    return distance.inFeet;
                  }
                },
                colorFn: (_, __) => chartColorFrom(Theme.of(context).primaryColor)
              ),
            ],
            defaultRenderer: LineRendererConfig(
              includeLine: true,
              includeArea: true,
              roundEndCaps: true,
              strokeWidthPx: 2,
            ),
            primaryMeasureAxis: AxisSpec(
              tickProviderSpec: BasicNumericTickProviderSpec(
                zeroBound: false,
                desiredMinTickCount: 6,
                desiredMaxTickCount: 8
              ),
              renderSpec: GridlineRendererSpec<num>(
                labelStyle: TextStyleSpec(
                  color: chartColorFrom(Theme.of(context).accentColor)
                ),
                lineStyle: LineStyleSpec(
                  color: chartColorFrom(Theme.of(context).disabledColor)
                ),
              )
            ),
            domainAxis: AxisSpec<num>(
              renderSpec: GridlineRendererSpec<num>(
                labelStyle: TextStyleSpec(
                  color: chartColorFrom(Theme.of(context).accentColor)
                ),
                lineStyle: LineStyleSpec(
                  color: chartColorFrom(Theme.of(context).disabledColor)
                ),
              ),
              tickProviderSpec: BasicNumericTickProviderSpec(
                dataIsInWholeNumbers: false,
                desiredMinTickCount: 4,
              ),
            ),
            behaviors: [
              LinePointHighlighter(
                showHorizontalFollowLine: LinePointHighlighterFollowLineType.none,
                showVerticalFollowLine: LinePointHighlighterFollowLineType.nearest,
                symbolRenderer: CircleSymbolRenderer(isSolid: false)
              ),
              SelectNearest(eventTrigger: SelectionTrigger.tapAndDrag),
              ChartTitle(
                metric ? 'kilometers' : 'miles',
                behaviorPosition: BehaviorPosition.bottom,
                titleStyleSpec: TextStyleSpec(
                  fontSize: 12,
                  color: chartColorFrom(Theme.of(context).accentColor),
                ),
              ),
              ChartTitle(
                metric ? 'meters' : 'feet',
                behaviorPosition: BehaviorPosition.start,
                titleStyleSpec: TextStyleSpec(
                  fontSize: 12,
                  color: chartColorFrom(Theme.of(context).accentColor),
                )
              )
            ],
            selectionModels: [
              SelectionModelConfig(
                changedListener: (model) {
                  if (model.selectedDatum.isNotEmpty) {
                    context.read<PathDrawingState>().highlightPoint(model.selectedDatum.first.datum as ElevationPoint);
                  } else {
                    context.read<PathDrawingState>().unhighlightPoint();
                  }
                },
              )
            ],
          ) : ElevationChartPlaceholder()
        );
      }
    );
  }
}