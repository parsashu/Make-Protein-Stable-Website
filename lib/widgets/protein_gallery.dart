import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProteinGallery extends StatelessWidget {
  const ProteinGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row of protein structures
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildProteinCard('Alpha Helix', AlphaHelixPainter()),
            _buildProteinCard('Beta Sheet', BetaSheetPainter()),
            _buildProteinCard('Enzyme Active Site', EnzymePainter()),
          ],
        ),
        const SizedBox(height: 40),
        // Second row of protein structures
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildProteinCard('Protein Domain', ProteinDomainPainter()),
            _buildProteinCard('Membrane Protein', MembraneProteinPainter()),
            _buildProteinCard('Antibody', AntibodyPainter()),
          ],
        ),
      ],
    );
  }

  Widget _buildProteinCard(String title, CustomPainter painter) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size(200, 200),
            painter: painter,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1a237e),
            ),
          ),
        ],
      ),
    );
  }
}

class AlphaHelixPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw alpha helix as a spiral
    for (int i = 0; i < 60; i++) {
      final t = i / 10.0;
      final radius = 30 + 20 * math.sin(t * 0.5);
      final x = center.dx + radius * math.cos(t);
      final y = center.dy + t * 8 - 120;

      if (y > 0 && y < size.height) {
        final sphereRadius = 6 + 2 * math.sin(t);
        paint.color = Color.lerp(
          const Color(0xFF3949ab),
          const Color(0xFF5c6bc0),
          (i / 60),
        )!;
        canvas.drawCircle(Offset(x, y), sphereRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BetaSheetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw beta sheet as parallel strands
    for (int strand = 0; strand < 5; strand++) {
      final strandY = center.dy - 80 + strand * 40;
      final direction = strand % 2 == 0 ? 1 : -1;

      for (int i = 0; i < 20; i++) {
        final x = center.dx - 80 + i * 8 * direction;
        final y = strandY + 5 * math.sin(i * 0.3);

        paint.color = Color.lerp(
          const Color(0xFF2196F3),
          const Color(0xFF81C784),
          (strand / 5),
        )!;
        canvas.drawCircle(Offset(x, y), 4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EnzymePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw enzyme with active site
    paint.color = const Color(0xFF4CAF50);
    canvas.drawCircle(center, 80, paint);

    // Active site cavity
    paint.color = const Color(0xFF2E7D32);
    canvas.drawCircle(center, 60, paint);

    // Substrate binding
    paint.color = const Color(0xFFFF9800);
    canvas.drawCircle(center, 25, paint);

    // Amino acid residues around active site
    final residues = [
      Offset(center.dx - 40, center.dy - 40),
      Offset(center.dx + 40, center.dy - 40),
      Offset(center.dx - 40, center.dy + 40),
      Offset(center.dx + 40, center.dy + 40),
    ];

    paint.color = const Color(0xFFE91E63);
    for (final residue in residues) {
      canvas.drawCircle(residue, 12, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProteinDomainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw multiple domains
    final domains = [
      {
        'center': Offset(center.dx - 50, center.dy - 30),
        'color': const Color(0xFF9C27B0),
        'radius': 40.0
      },
      {
        'center': Offset(center.dx + 50, center.dy - 30),
        'color': const Color(0xFF3F51B5),
        'radius': 35.0
      },
      {
        'center': Offset(center.dx, center.dy + 50),
        'color': const Color(0xFF009688),
        'radius': 45.0
      },
    ];

    for (final domain in domains) {
      paint.color = domain['color'] as Color;
      canvas.drawCircle(
          domain['center'] as Offset, domain['radius'] as double, paint);
    }

    // Linker regions
    final linkerPaint = Paint()
      ..color = const Color(0xFF607D8B)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(center.dx - 50, center.dy - 30),
      Offset(center.dx + 50, center.dy - 30),
      linkerPaint,
    );
    canvas.drawLine(
      Offset(center.dx, center.dy - 30),
      Offset(center.dx, center.dy + 50),
      linkerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MembraneProteinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw membrane
    paint.color = const Color(0xFFFFEB3B).withOpacity(0.3);
    canvas.drawRect(
      Rect.fromLTWH(0, center.dy - 30, size.width, 60),
      paint,
    );

    // Transmembrane helices
    for (int i = 0; i < 7; i++) {
      final x = 30.0 + i * 25.0;
      paint.color = Color.lerp(
        const Color(0xFFE91E63),
        const Color(0xFF9C27B0),
        (i / 7),
      )!;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, center.dy - 25, 15, 50),
          const Radius.circular(8),
        ),
        paint,
      );
    }

    // Extracellular and intracellular domains
    paint.color = const Color(0xFF2196F3);
    canvas.drawCircle(Offset(center.dx - 40, center.dy - 70), 25, paint);
    canvas.drawCircle(Offset(center.dx + 40, center.dy + 70), 25, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AntibodyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Heavy chains
    paint.color = const Color(0xFF3F51B5);
    canvas.drawCircle(Offset(center.dx - 30, center.dy), 50, paint);
    canvas.drawCircle(Offset(center.dx + 30, center.dy), 50, paint);

    // Light chains
    paint.color = const Color(0xFF2196F3);
    canvas.drawCircle(Offset(center.dx - 60, center.dy - 40), 30, paint);
    canvas.drawCircle(Offset(center.dx + 60, center.dy - 40), 30, paint);

    // Antigen binding sites
    paint.color = const Color(0xFFFF5722);
    canvas.drawCircle(Offset(center.dx - 45, center.dy - 60), 15, paint);
    canvas.drawCircle(Offset(center.dx + 45, center.dy - 60), 15, paint);

    // Hinge region
    final hingePaint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(center.dx - 30, center.dy + 50),
      Offset(center.dx + 30, center.dy + 50),
      hingePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
