import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/bottom_sheet/bottom_sheet_header.dart';
import 'package:snap_path/ui/bottom_sheet/elevation_chart.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MapBottomSheet extends StatelessWidget {
  final MediaQueryData mediaQuery;

  MapBottomSheet({@required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    double sheetHeight;
    double sheetWidth;
    double sheetPadding;
    EdgeInsets sheetCover;

    if (mediaQuery.size.width > 720 || mediaQuery.size.aspectRatio > 1.5) {
      sheetPadding = 14;
      sheetHeight = min(400, mediaQuery.size.height - sheetPadding - 120);
      sheetWidth = min(400, mediaQuery.size.width / 2);
      sheetCover = EdgeInsets.only(left: sheetWidth);
    } else {
      sheetPadding = 0;
      sheetHeight = mediaQuery.size.height / 2 - 120;
      sheetWidth = mediaQuery.size.width;
      sheetCover = EdgeInsets.only(bottom: sheetHeight + 120);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sheetPadding),
      width: sheetWidth,
      child: SolidBottomSheet(
        onHide: () {
          context.read<AppState>().toggleControls(true);
          context.read<PathDrawingState>().unhighlightPoint();
        },
        onShow: () {
          var appState = context.read<AppState>();
          var pathDrawing = context.read<PathDrawingState>();
          
          appState.toggleControls(false);
          if (pathDrawing.isNotEmpty) {
            // Zoom to show the whole path
            appState.moveToShow(
              bounds: pathDrawing.bounds,
              padding: mediaQuery.viewPadding + EdgeInsets.all(30) + sheetCover,
            );
          }
        },
        headerBar: BottomSheetHeader(),
        maxHeight: sheetHeight,
        body: SingleChildScrollView(
          child: Container(
            height: sheetHeight,
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: ElevationChart()
          ),
        ),
      ),
    );
  }
}