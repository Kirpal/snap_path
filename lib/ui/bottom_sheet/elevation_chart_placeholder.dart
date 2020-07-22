import 'package:flutter/material.dart';

/// Shown before there is any elevation data to chart
class ElevationChartPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).disabledColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Start drawing to see the elevation!',
          style:
              TextStyle(color: Theme.of(context).accentColor.withOpacity(0.5)),
        ),
      ),
    );
  }
}
