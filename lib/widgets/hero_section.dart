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
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 768;
    final isMediumScreen = screenSize.width < 1024;

    // Responsive height
    final heroHeight = isSmallScreen ? 500.0 : (isMediumScreen ? 550.0 : 600.0);

    return Container(
      height: heroHeight,
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 20 : 40,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Make Protein Stable',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize:
                              isSmallScreen ? 28 : (isMediumScreen ? 32 : 36),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 16),
                  Text(
                    'AI-Powered Protein Stability Enhancement',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : (isMediumScreen ? 20 : 24),
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isSmallScreen ? 24 : 32),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 32 : 40,
                        vertical: isSmallScreen ? 16 : 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Try It Now',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
