import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 768;
    final isMediumScreen = screenSize.width < 1024;

    // Responsive padding
    final sectionPadding =
        isSmallScreen ? 20.0 : (isMediumScreen ? 40.0 : 80.0);

    return Container(
      padding: EdgeInsets.all(sectionPadding),
      color: const Color(0xFF1a237e),
      child: isSmallScreen
          ? Column(
              children: [
                _buildFooterContent(isSmallScreen),
                const SizedBox(height: 20),
                _buildFooterBottom(isSmallScreen),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _buildFooterContent(isSmallScreen),
                ),
                const SizedBox(width: 40),
                _buildFooterBottom(isSmallScreen),
              ],
            ),
    );
  }

  Widget _buildFooterContent(bool isSmallScreen) {
    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Make Protein Stable',
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: isSmallScreen ? 8 : 12),
        Text(
          'Enhancing protein stability through intelligent single amino acid modifications.',
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 16,
            color: Colors.white70,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }

  Widget _buildFooterBottom(bool isSmallScreen) {
    return Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        Text(
          'Developed by Parsa Shahidi',
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            color: Colors.white70,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.end,
        ),
        SizedBox(height: isSmallScreen ? 4 : 6),
        Text(
          'mr.parsa.shahidi@gmail.com',
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            color: Colors.white70,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.end,
        ),
      ],
    );
  }
}
