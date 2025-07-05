import 'package:flutter/material.dart';

class ProteinPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw protein-like molecular structure pattern
    final random = [0.1, 0.3, 0.7, 0.2, 0.8, 0.4, 0.9, 0.5, 0.6, 0.15];

    for (int i = 0; i < 10; i++) {
      final x = size.width * random[i];
      final y = size.height * random[(i + 3) % 10];
      final radius = 20 + (random[(i + 5) % 10] * 30);

      canvas.drawCircle(Offset(x, y), radius, paint);

      // Draw connections
      if (i > 0) {
        final prevX = size.width * random[i - 1];
        final prevY = size.height * random[(i + 2) % 10];
        canvas.drawLine(Offset(prevX, prevY), Offset(x, y), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
