import 'package:flutter/material.dart';

class ScalePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..strokeWidth = 1.5;

    // Define the number of markers
    int numberOfMarkers = 50;
    double markerSpacing = size.width / (numberOfMarkers - 1);

    for (int i = 0; i < numberOfMarkers; i++) {
      double xPosition = i * markerSpacing;
      double markerHeight =
          (i == numberOfMarkers ~/ 2) ? 50 : 20; // Make center line bigger

      canvas.drawLine(
        Offset(xPosition, size.height / 2 - markerHeight / 2),
        Offset(xPosition, size.height / 2 + markerHeight / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
