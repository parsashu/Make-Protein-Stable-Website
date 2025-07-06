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
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 768;
    final isMediumScreen = screenSize.width < 1024;

    if (isLoading) {
      return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
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
            SizedBox(height: isSmallScreen ? 12 : 16),
            Text(
              'Analyzing protein sequence...',
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
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
        padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
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
              size: isSmallScreen ? 40 : 48,
            ),
            SizedBox(height: isSmallScreen ? 12 : 16),
            Text(
              'Error',
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 18,
                fontWeight: FontWeight.w600,
                color: Colors.red[800],
              ),
            ),
            SizedBox(height: isSmallScreen ? 6 : 8),
            Text(
              result!.error ?? 'Unknown error occurred',
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 14,
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
      padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
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
                padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green[700],
                  size: isSmallScreen ? 16 : 20,
                ),
              ),
              SizedBox(width: isSmallScreen ? 8 : 12),
              Expanded(
                child: Text(
                  'Improvement Results',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[800],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: isSmallScreen ? 16 : 20),

          // Results Grid - responsive layout
          isSmallScreen
              ? Column(
                  children: [
                    _buildResultGroup('Position & Amino Acids', [
                      _buildResultItem(
                        'Changed Position',
                        '${data.changedPosition}',
                        Colors.green[600]!,
                      ),
                      _buildResultItem(
                        'Original Amino Acid',
                        data.originalAminoAcid,
                        Colors.green[600]!,
                      ),
                      _buildResultItem(
                        'Changed Amino Acid',
                        data.changedAminoAcid,
                        Colors.green[600]!,
                      ),
                    ]),
                    const SizedBox(height: 20),
                    _buildResultGroup('Stability Analysis', [
                      _buildResultItem(
                        'Stability Change (ΔTm)',
                        '${data.tmChange > 0 ? '+' : ''}${data.tmChange.toStringAsFixed(2)}°C',
                        Colors.green[700]!,
                        note: 'Approximate value',
                      ),
                      _buildResultItem(
                        'Status',
                        data.status,
                        Colors.green[700]!,
                      ),
                    ]),
                  ],
                )
              : Row(
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
                          SizedBox(height: isSmallScreen ? 12 : 16),
                          _buildResultItem(
                            'Original Amino Acid',
                            data.originalAminoAcid,
                            Colors.green[600]!,
                          ),
                          SizedBox(height: isSmallScreen ? 12 : 16),
                          _buildResultItem(
                            'Changed Amino Acid',
                            data.changedAminoAcid,
                            Colors.green[600]!,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: isMediumScreen ? 24 : 32),

                    // Right Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildResultItem(
                            'Stability Change (ΔTm)',
                            '${data.tmChange > 0 ? '+' : ''}${data.tmChange.toStringAsFixed(2)}°C',
                            Colors.green[700]!,
                            note: 'Approximate value',
                          ),
                          SizedBox(height: isSmallScreen ? 12 : 16),
                          _buildResultItem(
                            'Status',
                            data.status,
                            Colors.green[700]!,
                          ),
                          SizedBox(height: isSmallScreen ? 12 : 16),
                          Container(
                            padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  color: Colors.green[700],
                                  size: isSmallScreen ? 14 : 16,
                                ),
                                SizedBox(width: isSmallScreen ? 6 : 8),
                                Expanded(
                                  child: Text(
                                    'Stability Enhanced',
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w600,
                                      fontSize: isSmallScreen ? 12 : 14,
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

          SizedBox(height: isSmallScreen ? 20 : 24),

          // Optimized Sequence
          _buildSequenceSection(data, isSmallScreen),
        ],
      ),
    );
  }

  Widget _buildResultGroup(String title, List<Widget> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[200]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: item,
              )),
        ],
      ),
    );
  }

  Widget _buildSequenceSection(data, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Final Optimized Sequence',
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 16,
            fontWeight: FontWeight.w600,
            color: Colors.green[800],
          ),
        ),
        SizedBox(height: isSmallScreen ? 6 : 8),
        Container(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
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
                padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: isSmallScreen ? 10 : 12,
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
                      const TextSpan(text: ' → '),
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
              SizedBox(height: isSmallScreen ? 8 : 12),
              // Final sequence
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
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
                        fontSize: isSmallScreen ? 10 : 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 6 : 8),
                    SelectableText(
                      data.optimizedSequence,
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: isSmallScreen ? 10 : 12,
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
    );
  }

  Widget _buildResultItem(String label, String value, Color color,
      {String? note}) {
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
        if (note != null)
          Text(
            '($note)',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[500],
              fontStyle: FontStyle.italic,
            ),
          ),
      ],
    );
  }
}
