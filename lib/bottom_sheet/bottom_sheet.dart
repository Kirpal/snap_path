import 'dart:math';

import 'package:bounding_box/bounding_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/bottom_sheet/bottom_sheet_header.dart';
import 'package:snap_path/bottom_sheet/elevation_chart.dart';
import 'package:snap_path/map/map.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

typedef MoveMapToShow = void Function(BoundingBox bounds, EdgeInsets padding);

class MapBottomSheet extends StatelessWidget {
  const MapBottomSheet({required this.mediaQuery, required this.moveMapToShow});

  final MediaQueryData mediaQuery;
  final MoveMapToShow moveMapToShow;

  @override
  Widget build(BuildContext context) {
    final headerHeight = 120 + mediaQuery.padding.bottom;
    double sheetHeight;
    double sheetWidth;
    EdgeInsets sheetPadding;
    EdgeInsets sheetCover;

    if (mediaQuery.size.width > 720 || mediaQuery.size.aspectRatio > 1.5) {
      sheetPadding = EdgeInsets.only(
        top: 14,
        left: 14 + mediaQuery.padding.left,
      );
      sheetHeight = min(
        300,
        mediaQuery.size.height - sheetPadding.vertical - headerHeight,
      );
      sheetWidth = min(400, mediaQuery.size.width / 2);

      if (mediaQuery.size.height > sheetHeight * 2) {
        sheetCover = EdgeInsets.only(
          bottom: sheetHeight + headerHeight + sheetPadding.vertical,
        );
      } else {
        sheetCover = EdgeInsets.only(
          left: sheetWidth + sheetPadding.horizontal,
        );
      }
    } else {
      sheetPadding = EdgeInsets.zero;
      sheetHeight = mediaQuery.size.height / 2 - headerHeight;
      sheetWidth = mediaQuery.size.width;
      sheetCover = EdgeInsets.only(
        bottom: sheetHeight + headerHeight + sheetPadding.vertical,
      );
    }

    return Container(
      padding: sheetPadding,
      width: sheetWidth,
      child: SolidBottomSheet(
        onHide: () {
          context.read<MapBloc>().add(const MapEvent.controlsToggled(true));
          context.read<MapBloc>().add(const MapEvent.pointUnhighlighted());
        },
        onShow: () {
          final route = context.read<DrawRouteBloc>().state.route;

          context.read<MapBloc>().add(const MapEvent.controlsToggled(false));
          if (route.coordinates.isNotEmpty) {
            moveMapToShow(
              route.bounds,
              mediaQuery.padding + const EdgeInsets.all(30) + sheetCover,
            );
          }
        },
        headerBar: BottomSheetHeader(mediaQuery),
        maxHeight: sheetHeight,
        body: SingleChildScrollView(
          child: Container(
            height: sheetHeight,
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.only(
              left: 15,
              top: 0,
              right: 15,
              bottom: 15 + mediaQuery.padding.bottom,
            ),
            child: const ElevationChart(),
          ),
        ),
      ),
    );
  }
}
