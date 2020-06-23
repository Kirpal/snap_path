
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snap_path/ui/bottom_sheet/bottom_sheet_header.dart';
import 'package:snap_path/ui/bottom_sheet/elevation_chart.dart';

/// The "bottom sheet" as a small window on large enough tablets
class BottomSheetWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        height: min(400, deviceHeight),
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(14)
        ),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          children: <Widget>[
            BottomSheetHeader(showHandle: false,),
            Expanded(
              child: ElevationChart()
            ),
          ],
        ),
      ),
    );
  }
}
