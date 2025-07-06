import 'package:flutter/material.dart';
import '../painters/protein_pattern_painter.dart';

class HeroSection extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey toolSectionKey;

  const HeroSection({
    super.key,
    required this.scrollController,
    required this.toolSectionKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1a237e),
            Color(0xFF3949ab),
            Color(0xFF5c6bc0),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Protein structure background pattern
          Positioned.fill(
            child: CustomPaint(
              painter: ProteinPatternPainter(),
            ),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Make Protein Stable',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'AI-Powered Protein Stability Enhancement',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Use Scrollable.ensureVisible for precise scrolling to the tool section
                    Scrollable.ensureVisible(
                      toolSectionKey.currentContext!,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.easeInOut,
                      alignment:
                          0.1, // Scroll to show text input near top of viewport
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1a237e),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                  child: const Text(
                    'Try It Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
