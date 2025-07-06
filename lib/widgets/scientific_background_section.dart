import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class ScientificBackgroundSection extends StatelessWidget {
  const ScientificBackgroundSection({super.key});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(
        'https://drive.google.com/drive/folders/1DIdfQ7AvZC-VDNecDFXa6xZILHpR8JKC?usp=sharing');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

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
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Key Strengths',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isSmallScreen ? 24 : (isMediumScreen ? 28 : 32),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1a237e),
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 24 : 40),
          Container(
            constraints: BoxConstraints(
                maxWidth: isSmallScreen ? double.infinity : 1000),
            child: Column(
              children: [
                SizedBox(height: isSmallScreen ? 20 : 40),

                // Research highlights cards - responsive layout
                isSmallScreen
                    ? Column(
                        children: [
                          _buildResearchCard(
                            Icons.psychology,
                            'Original Custom-Trained Model',
                            'Developed from scratch and fine-tuned on curated datasets.',
                            const Color(0xFF1a237e),
                            isSmallScreen,
                          ),
                          const SizedBox(height: 20),
                          _buildResearchCard(
                            Icons.science,
                            'Keep Same Functionality',
                            'Designed to enhance thermal stability while preserving the original protein\'s functionality.',
                            const Color(0xFF3949ab),
                            isSmallScreen,
                          ),
                          const SizedBox(height: 20),
                          _buildResearchCard(
                            Icons.dataset,
                            'Easy to Use',
                            'Just paste your protein sequence — the tool automatically analyzes and suggests more stable variant.',
                            const Color(0xFF5c6bc0),
                            isSmallScreen,
                          ),
                        ],
                      )
                    : isMediumScreen
                        ? Column(
                            children: [
                              // First row - 2 cards
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildResearchCard(
                                        Icons.psychology,
                                        'Original Custom-Trained Model',
                                        'Developed from scratch and fine-tuned on curated datasets.',
                                        const Color(0xFF1a237e),
                                        isSmallScreen,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: _buildResearchCard(
                                        Icons.science,
                                        'Keep Same Functionality',
                                        'Designed to enhance thermal stability while preserving the original protein\'s functionality.',
                                        const Color(0xFF3949ab),
                                        isSmallScreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Second row - 1 card centered
                              Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: _buildResearchCard(
                                    Icons.dataset,
                                    'Easy to Use',
                                    'Just paste your protein sequence — the tool automatically analyzes and suggests more stable variant.',
                                    const Color(0xFF5c6bc0),
                                    isSmallScreen,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: _buildResearchCard(
                                    Icons.psychology,
                                    'Original Custom-Trained Model',
                                    'Developed from scratch and fine-tuned on curated datasets.',
                                    const Color(0xFF1a237e),
                                    isSmallScreen,
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: _buildResearchCard(
                                    Icons.science,
                                    'Keep Same Functionality',
                                    'Designed to enhance thermal stability while preserving the original protein\'s functionality.',
                                    const Color(0xFF3949ab),
                                    isSmallScreen,
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: _buildResearchCard(
                                    Icons.dataset,
                                    'Easy to Use',
                                    'Just paste your protein sequence — the tool automatically analyzes and suggests more stable variant.',
                                    const Color(0xFF5c6bc0),
                                    isSmallScreen,
                                  ),
                                ),
                              ],
                            ),
                          ),

                SizedBox(height: isSmallScreen ? 30 : 50),

                // Technical report section
                Container(
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF1a237e).withOpacity(0.1),
                        const Color(0xFF3949ab).withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF1a237e).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.article,
                        size: isSmallScreen ? 36 : 48,
                        color: const Color(0xFF1a237e),
                      ),
                      SizedBox(height: isSmallScreen ? 12 : 16),
                      Text(
                        'Full Technical Report',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 20 : 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1a237e),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isSmallScreen ? 8 : 12),
                      Text(
                        'Access our comprehensive technical documentation detailing the machine learning methodology, training process, validation results, and scientific foundation behind our protein stability enhancement tool.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isSmallScreen ? 13 : 14,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 24),
                      ElevatedButton.icon(
                        onPressed: _launchURL,
                        icon: Icon(
                          Icons.download,
                          size: isSmallScreen ? 16 : 20,
                        ),
                        label: Text(
                          'View Technical Report',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1a237e),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 20 : 32,
                            vertical: isSmallScreen ? 12 : 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 6 : 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: isSmallScreen ? 10 : 12,
                            color: Colors.grey[600],
                          ),
                          children: [
                            const TextSpan(text: 'Document: '),
                            TextSpan(
                              text: 'ML on Proteins.pdf',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1a237e),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _launchURL,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResearchCard(IconData icon, String title, String description,
      Color color, bool isSmallScreen) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isSmallScreen ? 32 : 40,
            color: color,
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              description,
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
