import 'package:flutter/material.dart';
import 'dart:math' as math;

class Protein3DStructure extends StatefulWidget {
  final double size;
  final Color color;

  const Protein3DStructure({
    super.key,
    this.size = 200,
    this.color = Colors.white,
  });

  @override
  State<Protein3DStructure> createState() => _Protein3DStructureState();
}

class _Protein3DStructureState extends State<Protein3DStructure>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: Protein3DPainter(
            rotation: _animation.value,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class Protein3DPainter extends CustomPainter {
  final double rotation;
  final Color color;

  Protein3DPainter({
    required this.rotation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    // Draw protein chain as connected spheres representing amino acids
    final aminoAcids = <Offset>[];

    // Create a complex 3D-like protein structure
    for (int i = 0; i < 50; i++) {
      final angle = i * 0.3 + rotation;
      final helixRadius = radius * (0.5 + 0.3 * math.sin(i * 0.2));
      final x = center.dx + helixRadius * math.cos(angle) * math.cos(i * 0.1);
      final y = center.dy +
          helixRadius * math.sin(angle) * math.cos(i * 0.1) +
          (i * 2 - 50) * math.sin(rotation * 0.5);

      aminoAcids.add(Offset(x, y));
    }

    // Draw connections between amino acids
    final connectionPaint = Paint()
      ..color = color.withOpacity(0.6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < aminoAcids.length - 1; i++) {
      canvas.drawLine(aminoAcids[i], aminoAcids[i + 1], connectionPaint);
    }

    // Draw amino acid spheres with different colors based on type
    for (int i = 0; i < aminoAcids.length; i++) {
      final sphereRadius = 4 + 2 * math.sin(i * 0.5);

      // Simulate different amino acid types with different colors
      Color sphereColor;
      switch (i % 4) {
        case 0:
          sphereColor = Colors.lightBlue.withOpacity(0.8);
          break;
        case 1:
          sphereColor = Colors.lightGreen.withOpacity(0.8);
          break;
        case 2:
          sphereColor = Colors.orange.withOpacity(0.8);
          break;
        default:
          sphereColor = Colors.pink.withOpacity(0.8);
      }

      paint.color = sphereColor;
      canvas.drawCircle(aminoAcids[i], sphereRadius, paint);

      // Add highlight for 3D effect
      paint.color = sphereColor.withOpacity(0.4);
      canvas.drawCircle(
        aminoAcids[i] + const Offset(-1, -1),
        sphereRadius * 0.6,
        paint,
      );
    }

    // Draw secondary structure elements (alpha helices)
    final helixPaint = Paint()
      ..color = color.withOpacity(0.3)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 3; i++) {
      final startAngle = i * 2 * math.pi / 3 + rotation;
      final helixCenter = Offset(
        center.dx + radius * 0.7 * math.cos(startAngle),
        center.dy + radius * 0.7 * math.sin(startAngle),
      );

      canvas.drawCircle(helixCenter, 15, helixPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
