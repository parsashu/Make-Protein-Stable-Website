import 'package:flutter/material.dart';
import 'feature_item.dart';
import 'protein_gallery.dart';

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
          Column(
            children: [
              // Description and features
              Container(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  children: [
                    Text(
                      'Our protein stability enhancement tool uses advanced AI algorithms to analyze and optimize protein sequences for improved stability and functionality.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    // Features in a grid layout
                    const Wrap(
                      spacing: 40,
                      runSpacing: 20,
                      children: [
                        FeatureItem(
                          icon: '🧬',
                          title: 'Sequence Analysis',
                          description:
                              'Advanced AI-powered protein sequence analysis',
                        ),
                        FeatureItem(
                          icon: '🔬',
                          title: 'Stability Prediction',
                          description: 'Predict and enhance protein stability',
                        ),
                        FeatureItem(
                          icon: '⚡',
                          title: 'Fast Processing',
                          description: 'Get results in seconds, not hours',
                        ),
                        FeatureItem(
                          icon: '🎯',
                          title: 'High Accuracy',
                          description: 'Scientifically validated algorithms',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),

              // Protein Gallery
              Text(
                'Protein Structures We Analyze',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const ProteinGallery(),
            ],
          ),
        ],
      ),
    );
  }
}
