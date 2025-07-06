import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 768;
    final isMediumScreen = screenSize.width < 1024;

    // Responsive padding
    final sectionPadding =
        isSmallScreen ? 20.0 : (isMediumScreen ? 40.0 : 80.0);
    final cardPadding = isSmallScreen ? 20.0 : (isMediumScreen ? 24.0 : 32.0);

    return Container(
      padding: EdgeInsets.all(sectionPadding),
      color: Colors.grey[50],
      constraints:
          const BoxConstraints(minWidth: 1), // Add minimum width constraint
      child: Column(
        children: [
          Text(
            'What We Do',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1a237e),
                  fontSize: isSmallScreen ? 24 : (isMediumScreen ? 28 : 32),
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 12 : 20),
          Text(
            'Enhancing protein stability through intelligent single amino acid modifications',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                  fontSize: isSmallScreen ? 14 : (isMediumScreen ? 16 : 18),
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 30 : 50),

          // Main content - responsive layout
          isSmallScreen
              ? Column(
                  children: [
                    _buildLeftContent(
                        context, cardPadding, isSmallScreen, isMediumScreen),
                    const SizedBox(height: 40),
                    _buildRightImage(isSmallScreen),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left content
                    Expanded(
                      flex: 3,
                      child: _buildLeftContent(
                          context, cardPadding, isSmallScreen, isMediumScreen),
                    ),

                    SizedBox(width: isMediumScreen ? 30 : 60),

                    // Right side image
                    Expanded(
                      flex: 2,
                      child: _buildRightImage(isSmallScreen),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context, double cardPadding,
      bool isSmallScreen, bool isMediumScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Description card
        Container(
          padding: EdgeInsets.all(cardPadding),
          constraints:
              const BoxConstraints(minWidth: 1), // Add minimum width constraint
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3949ab).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.biotech,
                      color: const Color(0xFF3949ab),
                      size: isSmallScreen ? 20 : 24,
                    ),
                  ),
                  SizedBox(width: isSmallScreen ? 12 : 16),
                  Expanded(
                    child: Text(
                      'AI-Powered Analysis',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1a237e),
                            fontSize:
                                isSmallScreen ? 16 : (isMediumScreen ? 18 : 20),
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isSmallScreen ? 16 : 20),
              Text(
                'Our advanced AI system analyzes your protein sequence and enhances thermal stability by intelligently suggesting single amino acid modifications while preserving the original 3D structure and functionality.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: Colors.grey[700],
                      fontSize: isSmallScreen ? 14 : (isMediumScreen ? 15 : 16),
                    ),
              ),
            ],
          ),
        ),

        SizedBox(height: isSmallScreen ? 24 : 40),

        // How it works section
        Container(
          padding: EdgeInsets.all(cardPadding),
          constraints:
              const BoxConstraints(minWidth: 1), // Add minimum width constraint
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF3949ab).withOpacity(0.05),
                const Color(0xFF5c6bc0).withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF3949ab).withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How it works:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1a237e),
                      fontSize: isSmallScreen ? 16 : (isMediumScreen ? 18 : 20),
                    ),
              ),
              SizedBox(height: isSmallScreen ? 16 : 24),

              // Steps with icons
              _buildStep(
                Icons.input,
                'Input your protein sequence',
                const Color(0xFF1a237e),
                isSmallScreen,
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),
              _buildStep(
                Icons.auto_awesome,
                'AI generates and evaluates single-point variants',
                const Color(0xFF3949ab),
                isSmallScreen,
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),
              _buildStep(
                Icons.science,
                'Uses biological constraints (BLOSUM & hydrophobicity)',
                const Color(0xFF5c6bc0),
                isSmallScreen,
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),
              _buildStep(
                Icons.analytics,
                'Ranks variants based on predicted thermal stability (Tm)',
                const Color(0xFF7986cb),
                isSmallScreen,
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),
              _buildStep(
                Icons.recommend,
                'Suggests the most stable version for structural integrity',
                const Color(0xFF9fa8da),
                isSmallScreen,
              ),
            ],
          ),
        ),

        SizedBox(height: isSmallScreen ? 24 : 32),

        // Performance metric
        Container(
          padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
          constraints:
              const BoxConstraints(minWidth: 1), // Add minimum width constraint
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF4caf50).withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4caf50).withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF4caf50).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.analytics_rounded,
                  color: const Color(0xFF4caf50),
                  size: isSmallScreen ? 24 : 32,
                ),
              ),
              SizedBox(width: isSmallScreen ? 12 : 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model Performance',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4caf50),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Spearman\'s Coefficient: 0.7232',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Strong correlation accuracy',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightImage(bool isSmallScreen) {
    return ConstrainedBox(
      // Replace FittedBox with ConstrainedBox
      constraints: BoxConstraints(
        minWidth: isSmallScreen ? 200 : 200,
        maxHeight: isSmallScreen ? 300 : double.infinity,
      ), // Set minimum width
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a237e),
              Color(0xFF3949ab),
              Color(0xFF5c6bc0),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3949ab).withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.cover, // Add fit property
                ),
              ),
              // Overlay gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF1a237e).withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(
      IconData icon, String text, Color color, bool isSmallScreen) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: isSmallScreen ? 20 : 24,
          ),
        ),
        SizedBox(width: isSmallScreen ? 12 : 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isSmallScreen ? 15 : 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
