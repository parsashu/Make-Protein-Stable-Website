import 'package:flutter/material.dart';
import 'results_widget.dart';

class ToolSection extends StatelessWidget {
  final TextEditingController sequenceController;

  const ToolSection({
    super.key,
    required this.sequenceController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          Text(
            'Analyze Your Protein',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Protein Sequence',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: TextField(
                    controller: sequenceController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText:
                          'Paste your protein sequence here (FASTA format or plain sequence)...\n\nExample:\nMGDVEKGKKIFVQKCAQCETVEKGGKHKTGPNLHGLFGRKTGQAPGFTYTDANKNKGITWKEETLMEYLENPKKYIPGTKMIFAGIKKKTEREDLIAYLKKATNE',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement sequence analysis
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Analysis feature coming soon!'),
                        ),
                      );
                    },
                    child: const Text('Analyze Sequence'),
                  ),
                ),

                // Results Widget
                const ResultsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
