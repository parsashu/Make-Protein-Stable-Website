import 'package:flutter/material.dart';
import '../models/protein_improvement_result.dart';

class ResultsWidget extends StatelessWidget {
  final ProteinImprovementResult? result;
  final bool isLoading;

  const ResultsWidget({
    super.key,
    this.result,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.blue[200]!,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Analyzing protein sequence...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    if (result == null) {
      return const SizedBox.shrink();
    }

    if (!result!.success) {
      return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.red[200]!,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: Colors.red[700],
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              result!.error ?? 'Unknown error occurred',
              style: TextStyle(
                fontSize: 14,
                color: Colors.red[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final data = result!.data!;
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.green[200]!,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green[700],
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Improvement Results',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green[800],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Results Grid
          Row(
            children: [
              // Left Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildResultItem(
                      'Changed Position',
                      '${data.changedPosition}',
                      Colors.green[600]!,
                    ),
                    const SizedBox(height: 16),
                    _buildResultItem(
                      'Original Amino Acid',
                      data.originalAminoAcid,
                      Colors.green[600]!,
                    ),
                    const SizedBox(height: 16),
                    _buildResultItem(
                      'Changed Amino Acid',
                      data.changedAminoAcid,
                      Colors.green[600]!,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 32),

              // Right Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildResultItem(
                      'Stability Change (ΔTm)',
                      '${data.tmChange > 0 ? '+' : ''}${data.tmChange.toStringAsFixed(2)}°C',
                      Colors.green[700]!,
                    ),
                    const SizedBox(height: 16),
                    _buildResultItem(
                      'Status',
                      data.status,
                      Colors.green[700]!,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: Colors.green[700],
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Stability Enhanced',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.w600,
                              ),
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

          const SizedBox(height: 24),

          // Optimized Sequence
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Final Optimized Sequence',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.green[200]!,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mutation details
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          children: [
                            const TextSpan(text: 'Mutation: '),
                            TextSpan(
                              text: data.originalAminoAcid,
                              style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: ' → '),
                            TextSpan(
                              text: data.changedAminoAcid,
                              style: TextStyle(
                                color: Colors.green[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Final sequence
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Final Sequence:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          SelectableText(
                            data.optimizedSequence,
                            style: const TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 12,
                              color: Colors.black87,
                              height: 1.5,
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
        ],
      ),
    );
  }

  Widget _buildResultItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
