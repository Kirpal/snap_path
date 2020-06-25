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
    double headerHeight = 120 + mediaQuery.padding.bottom;
    double sheetHeight;
    double sheetWidth;
    EdgeInsets sheetPadding;
    EdgeInsets sheetCover;

    if (mediaQuery.size.width > 720 || mediaQuery.size.aspectRatio > 1.5) {
      sheetPadding = EdgeInsets.only(top: 14, left: 14) + EdgeInsets.only(left: mediaQuery.padding.left);
      sheetHeight = min(300, mediaQuery.size.height - sheetPadding.vertical - headerHeight);
      sheetWidth = min(400, mediaQuery.size.width / 2);
      if (mediaQuery.size.height > sheetHeight * 2) {
        sheetCover = EdgeInsets.only(bottom: sheetHeight + headerHeight + sheetPadding.vertical);
      } else {
        sheetCover = EdgeInsets.only(left: sheetWidth + sheetPadding.horizontal);
      }
    } else {
      sheetPadding = EdgeInsets.zero;
      sheetHeight = mediaQuery.size.height / 2 - headerHeight;
      sheetWidth = mediaQuery.size.width;
      sheetCover = EdgeInsets.only(bottom: sheetHeight + headerHeight + sheetPadding.vertical);
    }

    return Container(
      padding: sheetPadding,
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
              padding: mediaQuery.padding + EdgeInsets.all(30) + sheetCover,
              // padding: viewPadding + EdgeInsets.all(30) + EdgeInsets.only(bottom: 250 + 140.0 + 2 * MediaQuery.of(context).padding.bottom)
            );
          }
        },
        headerBar: BottomSheetHeader(mediaQuery),
        maxHeight: sheetHeight,
        body: SingleChildScrollView(
          child: Container(
            height: sheetHeight,
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15) + EdgeInsets.only(bottom: mediaQuery.padding.bottom),
            child: ElevationChart()
          ),
        ),
      ),
    );
  }
}