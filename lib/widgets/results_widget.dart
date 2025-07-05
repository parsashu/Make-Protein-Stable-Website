import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Analysis Results',
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
                      '19',
                      Colors.green[600]!,
                    ),
                    const SizedBox(height: 16),
                    _buildResultItem(
                      'Original Amino Acid',
                      'H (Histidine)',
                      Colors.green[600]!,
                    ),
                    const SizedBox(height: 16),
                    _buildResultItem(
                      'Changed Amino Acid',
                      'E (Glutamate)',
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
                      '+10.84°C',
                      Colors.green[700]!,
                    ),
                    const SizedBox(height: 16),
                    _buildResultItem(
                      'Status',
                      'Improved',
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
                'Optimized Sequence',
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
                    const Text(
                      'MGDVEKGKKIFVQKCAQCETGPNLHGLFGRKTGQAPGFTYTDANKNKGITWKEETLMEYLENPKKYIPGTKMIFAGIKKKTEREDLIAYLKKATNE',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 12,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                        children: [
                          const TextSpan(text: 'Position 19: '),
                          TextSpan(
                            text: 'H',
                            style: TextStyle(
                              color: Colors.red[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' → '),
                          TextSpan(
                            text: 'E',
                            style: TextStyle(
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold,
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
