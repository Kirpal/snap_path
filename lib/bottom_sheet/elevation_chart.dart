import 'package:charts_flutter/flutter.dart' hide Color;
import 'package:charts_flutter/flutter.dart' as charts show Color;
import 'package:flutter/material.dart' hide Route, Color;
import 'package:flutter/material.dart' as material show Color;
import 'package:provider/provider.dart';
import 'package:route/route.dart';
import 'package:snap_path/app/app.dart';
import 'package:snap_path/bottom_sheet/elevation_chart_placeholder.dart';
import 'package:snap_path/map/map.dart';

extension on material.Color {
  /// Create a color for the Charts library from the given material color
  charts.Color get forChart => charts.Color(
        r: red,
        g: green,
        b: blue,
        a: alpha,
      );
}

class ElevationChart extends StatelessWidget {
  const ElevationChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showChart = context
        .select((DrawRouteBloc bloc) => bloc.state.route.hasElevationData);

    if (showChart) {
      return const ElevationChartWithData();
    } else {
      return const ElevationChartPlaceholder();
    }
  }
}

class ElevationChartWithData extends StatelessWidget {
  const ElevationChartWithData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMetric = context
        .select((AppPreferences preferences) => preferences.isMetric.value);
    final route = context.select((DrawRouteBloc bloc) => bloc.state.route);
    return LineChart(
      <Series<RoutePoint, double>>[
        Series<RoutePoint, double>(
          id: 'elevationChart',
          data: route.filtered,
          domainFn: (point, _) {
            if (isMetric) {
              return point.distance.inKilometers;
            } else {
              return point.distance.inMiles;
            }
          },
          measureFn: (point, _) {
            if (isMetric) {
              return point.elevation.inMeters;
            } else {
              return point.elevation.inFeet;
            }
          },
          colorFn: (_, __) => Theme.of(context).primaryColor.forChart,
        ),
      ],
      defaultRenderer: LineRendererConfig(
        includeLine: true,
        includeArea: true,
        roundEndCaps: true,
        strokeWidthPx: 2,
      ),
      primaryMeasureAxis: NumericAxisSpec(
        tickProviderSpec: const BasicNumericTickProviderSpec(
          zeroBound: false,
          desiredMinTickCount: 6,
          desiredMaxTickCount: 8,
        ),
        renderSpec: GridlineRendererSpec<num>(
          labelStyle: TextStyleSpec(
            color: Theme.of(context).accentColor.forChart,
          ),
          lineStyle: LineStyleSpec(
            color: Theme.of(context).disabledColor.forChart,
          ),
        ),
      ),
      domainAxis: AxisSpec<num>(
        renderSpec: GridlineRendererSpec<num>(
          labelStyle: TextStyleSpec(
            color: Theme.of(context).accentColor.forChart,
          ),
          lineStyle: LineStyleSpec(
            color: Theme.of(context).disabledColor.forChart,
          ),
        ),
        tickProviderSpec: const BasicNumericTickProviderSpec(
          dataIsInWholeNumbers: false,
          desiredMinTickCount: 4,
        ),
      ),
      behaviors: [
        LinePointHighlighter(
          showHorizontalFollowLine: LinePointHighlighterFollowLineType.none,
          showVerticalFollowLine: LinePointHighlighterFollowLineType.nearest,
          symbolRenderer: CircleSymbolRenderer(isSolid: false),
        ),
        SelectNearest(
          eventTrigger: SelectionTrigger.tapAndDrag,
        ),
        ChartTitle(
          isMetric ? 'kilometers' : 'miles',
          behaviorPosition: BehaviorPosition.bottom,
          titleStyleSpec: TextStyleSpec(
            fontSize: 12,
            color: Theme.of(context).accentColor.forChart,
          ),
        ),
        ChartTitle(
          isMetric ? 'meters' : 'feet',
          behaviorPosition: BehaviorPosition.start,
          titleStyleSpec: TextStyleSpec(
            fontSize: 12,
            color: Theme.of(context).accentColor.forChart,
          ),
        ),
      ],
      selectionModels: [
        SelectionModelConfig(
          changedListener: (model) {
            if (model.selectedDatum.isNotEmpty) {
              final point = model.selectedDatum.first.datum as RoutePoint;
              context.read<MapBloc>().add(MapEvent.pointHighlighted(point));
            } else {
              context.read<MapBloc>().add(const MapEvent.pointUnhighlighted());
            }
          },
        ),
      ],
    );
  }
}
