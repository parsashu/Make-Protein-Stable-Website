import 'package:flutter/material.dart';
import 'feature_item.dart';

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our protein stability enhancement tool uses advanced AI algorithms to analyze and optimize protein sequences for improved stability and functionality.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Key Features:',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    const FeatureItem(
                      icon: '🧬',
                      title: 'Sequence Analysis',
                      description:
                          'Advanced AI-powered protein sequence analysis',
                    ),
                    const FeatureItem(
                      icon: '🔬',
                      title: 'Stability Prediction',
                      description: 'Predict and enhance protein stability',
                    ),
                    const FeatureItem(
                      icon: '⚡',
                      title: 'Fast Processing',
                      description: 'Get results in seconds, not hours',
                    ),
                    const FeatureItem(
                      icon: '🎯',
                      title: 'High Accuracy',
                      description: 'Scientifically validated algorithms',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),
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
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.biotech,
                      size: 120,
                      color: Colors.white,
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
}
