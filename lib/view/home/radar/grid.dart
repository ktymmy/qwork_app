import 'package:flutter/material.dart';
import 'dart:math';
import '../../../const/color.dart';

class Grid extends CustomPainter {
  final int divisions;
  final Color gridColor;
  final List<Map<String, double>> points;

  Grid({
    this.divisions = 8,
    this.gridColor = GridColor.grid,
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double radiusStep = size.width / (2 * divisions);

    for (int i = 1; i <= divisions; i++) {
      canvas.drawCircle(size.center(Offset.zero), i * radiusStep, paint);
    }

    final pointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    for (int i = 0; i < points.length; i++) {
      final fixedAngle = points[i]['fixedAngle']!;
      final radius =
          points[i]['radius']! * min(size.width, size.height) / (2 * divisions);
      final point = Offset(size.width / 2 + radius * cos(fixedAngle - pi / 2),
          size.height / 2 + radius * sin(fixedAngle - pi / 2));
      canvas.drawCircle(point, 6.0, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
