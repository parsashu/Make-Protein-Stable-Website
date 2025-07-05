import 'package:flutter/material.dart';
import 'example_card.dart';

class ExamplesSection extends StatelessWidget {
  const ExamplesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Success Stories',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const Row(
            children: [
              Expanded(
                child: ExampleCard(
                  title: 'Enzyme Stability',
                  description:
                      'Original: 45% activity at 60°C\nImproved: 87% activity at 60°C',
                  improvement: '+94% stability improvement',
                ),
              ),
              SizedBox(width: 32),
              Expanded(
                child: ExampleCard(
                  title: 'Protein Folding',
                  description:
                      'Original: 2.3 kcal/mol stability\nImproved: 5.7 kcal/mol stability',
                  improvement: '+148% folding stability',
                ),
              ),
              SizedBox(width: 32),
              Expanded(
                child: ExampleCard(
                  title: 'Therapeutic Protein',
                  description:
                      'Original: 12 hours half-life\nImproved: 48 hours half-life',
                  improvement: '+300% extended half-life',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
