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
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Scientific Foundation',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                Text(
                  'Our protein stability enhancement tool is built on rigorous scientific research and advanced machine learning methodologies. The underlying model has been trained on comprehensive datasets and validated through extensive testing.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                // Research highlights cards
                Row(
                  children: [
                    Expanded(
                      child: _buildResearchCard(
                        Icons.psychology,
                        'Original Custom-Trained Model',
                        'Developed from scratch and fine-tuned on curated datasets.',
                        const Color(0xFF1a237e),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: _buildResearchCard(
                        Icons.science,
                        'Whith no Structural Disruption',
                        'Designed to enhance thermal stability through point mutations while preserving the original protein’s functionality and 3D structure.',
                        const Color(0xFF3949ab),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: _buildResearchCard(
                        Icons.dataset,
                        'Comprehensive Data',
                        'Trained on extensive protein stability datasets',
                        const Color(0xFF5c6bc0),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // Technical report section
                Container(
                  padding: const EdgeInsets.all(32),
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
                      const Icon(
                        Icons.article,
                        size: 48,
                        color: Color(0xFF1a237e),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Full Technical Report',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1a237e),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Access our comprehensive technical documentation detailing the machine learning methodology, training process, validation results, and scientific foundation behind our protein stability enhancement tool.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _launchURL,
                        icon: const Icon(Icons.download),
                        label: const Text('View Technical Report'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1a237e),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
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

  Widget _buildResearchCard(
      IconData icon, String title, String description, Color color) {
    return Container(
      padding: const EdgeInsets.all(24),
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
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
