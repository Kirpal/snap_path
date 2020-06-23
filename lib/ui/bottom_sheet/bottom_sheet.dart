import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_path/ui/bottom_sheet/bottom_sheet_header.dart';
import 'package:snap_path/ui/bottom_sheet/elevation_chart.dart';
import 'package:snap_path/models/map_view_state.dart';
import 'package:snap_path/models/path_drawing.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MapBottomSheet extends StatelessWidget {
  final EdgeInsets viewPadding;

  MapBottomSheet({this.viewPadding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return SolidBottomSheet(
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
            padding: viewPadding + EdgeInsets.all(30) + EdgeInsets.only(bottom: 250 + 140.0)
          );
        }
      },
      headerBar: BottomSheetHeader(),
      maxHeight: 250,
      body: SingleChildScrollView(
        child: Container(
          height: 250,
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: ElevationChart()
        ),
      ),
    );
  }
}