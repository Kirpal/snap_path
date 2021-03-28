import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/colors.dart';
import 'package:snap_path/models/elevation_data.dart';
import 'package:snap_path/models/map_view_state.dart';

class HighlightedPointMarker extends Marker {
  HighlightedPointMarker(ElevationPoint highlightedPoint)
      : super(
          width: 60,
          height: 64,
          anchorPos: AnchorPos.exactly(Anchor(30, 8)),
          point: highlightedPoint?.coordinate,
          builder: (ctx) => Selector<AppState, bool>(
              selector: (context, state) => state.isMetric,
              builder: (context, metric, _) {
                if (highlightedPoint == null) {
                  return Container();
                }
                String elevation;
                String distance;

                if (metric) {
                  elevation = '${highlightedPoint.elevation.inMeters.round()}m';
                  final inKilometers =
                      highlightedPoint.distance.inKilometers.toStringAsFixed(2);
                  distance = '${inKilometers}km';
                } else {
                  elevation = '${highlightedPoint.elevation.inFeet.round()}ft';
                  final inMiles =
                      highlightedPoint.distance.inMiles.toStringAsFixed(2);
                  distance = '${inMiles}mi';
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(bottom: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: AutoSizeText(
                        '$distance\n$elevation',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2),
                      ),
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 3, color: AppColors.primary),
                      ),
                    ),
                  ],
                );
              }),
        );
}
