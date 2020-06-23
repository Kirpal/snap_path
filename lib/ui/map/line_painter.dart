
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:snap_path/colors.dart';

/// Paint the drawn path
class LinePainter extends CustomPainter {
  final List<Offset> points;
  final double strokeWidth;
  LinePainter({this.points = const [], this.strokeWidth = 15});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the dotted line
    canvas.drawPath(
      dashPath(Path()..addPolygon(points, false),
      dashArray: CircularIntervalList<double>([0, strokeWidth * 1.2])), Paint()
                ..strokeCap = StrokeCap.round
                ..strokeJoin = StrokeJoin.round
                ..isAntiAlias = true
                ..style = PaintingStyle.stroke
                ..color = AppColors.primary
                ..strokeWidth = strokeWidth);
    if (points.isNotEmpty) {
      // Draw the marker at the beginning of the line
      canvas.drawCircle(points.first, strokeWidth / 1.5, Paint()..color = Colors.white);
      canvas.drawCircle(points.first, strokeWidth / 1.5, Paint()..color = AppColors.primary
                                                                ..style = PaintingStyle.stroke
                                                                ..strokeWidth = strokeWidth / 3);
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;
}