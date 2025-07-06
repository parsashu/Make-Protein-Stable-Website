import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      constraints: const BoxConstraints(minWidth: 1), // Add minimum width constraint
      child: Column(
        children: [
          Text(
            'What We Do',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1a237e),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Enhancing protein stability through intelligent single amino acid modifications',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          // Main content row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left content
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description card
                    Container(
                      padding: const EdgeInsets.all(32),
                      constraints: const BoxConstraints(minWidth: 1), // Add minimum width constraint
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
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF3949ab).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.biotech,
                                  color: Color(0xFF3949ab),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'AI-Powered Analysis',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF1a237e),
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Our advanced AI system analyzes your protein sequence and enhances thermal stability by intelligently suggesting single amino acid modifications while preserving the original 3D structure and functionality.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1.6,
                                      color: Colors.grey[700],
                                    ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // How it works section
                    Container(
                      padding: const EdgeInsets.all(32),
                      constraints: const BoxConstraints(minWidth: 1), // Add minimum width constraint
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
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1a237e),
                                ),
                          ),
                          const SizedBox(height: 24),

                          // Steps with icons
                          _buildStep(
                            Icons.input,
                            'Input your protein sequence',
                            const Color(0xFF1a237e),
                          ),
                          const SizedBox(height: 16),
                          _buildStep(
                            Icons.auto_awesome,
                            'AI generates and evaluates single-point variants',
                            const Color(0xFF3949ab),
                          ),
                          const SizedBox(height: 16),
                          _buildStep(
                            Icons.science,
                            'Uses biological constraints (BLOSUM & hydrophobicity)',
                            const Color(0xFF5c6bc0),
                          ),
                          const SizedBox(height: 16),
                          _buildStep(
                            Icons.analytics,
                            'Ranks variants based on predicted thermal stability (Tm)',
                            const Color(0xFF7986cb),
                          ),
                          const SizedBox(height: 16),
                          _buildStep(
                            Icons.recommend,
                            'Suggests the most stable version for structural integrity',
                            const Color(0xFF9fa8da),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Performance metric
                    Container(
                      padding: const EdgeInsets.all(24),
                      constraints: const BoxConstraints(minWidth: 1), // Add minimum width constraint
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
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4caf50).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.analytics_rounded,
                              color: Color(0xFF4caf50),
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Model Performance',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4caf50),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Spearman\'s Coefficient: 0.7232',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Strong correlation accuracy',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // Right side image
              Expanded(
                flex: 2,
                child: ConstrainedBox( // Replace FittedBox with ConstrainedBox
                  constraints: const BoxConstraints(minWidth: 200), // Set minimum width
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(IconData icon, String text, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
