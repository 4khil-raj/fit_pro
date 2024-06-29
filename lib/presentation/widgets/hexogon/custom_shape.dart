import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(width * 0.5, 0); // Top center
    path.lineTo(width, height * 0.25); // Top right
    path.lineTo(width, height * 0.75); // Bottom right
    path.lineTo(width * 0.5, height); // Bottom center
    path.lineTo(0, height * 0.75); // Bottom left
    path.lineTo(0, height * 0.25); // Top left
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
