import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'What We Do',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              // Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our AI-powered tool analyzes your protein sequence and enhances stability by intelligently changing just one amino acid at a time while preserving the original 3D structure.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'How it works:',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '• Input your protein sequence\n• AI analyzes stability patterns\n• Suggests single amino acid changes\n• Maintains 3D structural integrity\n• Provides stability improvements',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // Microscope representation
              Expanded(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF3949ab),
                        Color(0xFF5c6bc0),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CustomPaint(
                    painter: MicroscopePainter(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MicroscopePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Microscope base
    paint.color = Colors.grey[300]!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, size.height - 40),
          width: 120,
          height: 20,
        ),
        const Radius.circular(10),
      ),
      paint,
    );

    // Microscope body
    paint.color = Colors.grey[600]!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + 60),
          width: 80,
          height: 180,
        ),
        const Radius.circular(8),
      ),
      paint,
    );

    // Microscope head
    paint.color = Colors.grey[700]!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy - 40),
          width: 100,
          height: 80,
        ),
        const Radius.circular(10),
      ),
      paint,
    );

    // Eyepiece
    paint.color = Colors.black;
    canvas.drawCircle(
      Offset(center.dx, center.dy - 70),
      15,
      paint,
    );

    // Objective lens
    paint.color = Colors.grey[800]!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + 120),
          width: 25,
          height: 40,
        ),
        const Radius.circular(5),
      ),
      paint,
    );

    // Stage
    paint.color = Colors.grey[400]!;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(center.dx, center.dy + 80),
          width: 90,
          height: 15,
        ),
        const Radius.circular(5),
      ),
      paint,
    );

    // Protein sample on stage
    paint.color = const Color(0xFF4CAF50);
    canvas.drawCircle(
      Offset(center.dx, center.dy + 80),
      8,
      paint,
    );

    // Light source
    paint.color = Colors.yellow[300]!;
    canvas.drawCircle(
      Offset(center.dx, center.dy + 180),
      12,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
