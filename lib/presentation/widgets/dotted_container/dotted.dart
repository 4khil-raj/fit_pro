import 'dart:ui';

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double spaceLength;

  DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.spaceLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(10),
    ));

    final dashPath = _createDashedPath(path, dashLength, spaceLength);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path path, double dashLength, double spaceLength) {
    final dashedPath = Path();
    final totalLength = dashLength + spaceLength;
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final segment = pathMetric.extractPath(distance, distance + dashLength);
        dashedPath.addPath(segment, Offset.zero);
        distance += totalLength;
      }
      distance = 0.0;
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
