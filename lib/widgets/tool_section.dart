import 'package:flutter/material.dart';
import 'results_widget.dart';
import '../services/api_service.dart';
import '../models/protein_improvement_result.dart';

class ToolSection extends StatefulWidget {
  final TextEditingController sequenceController;

  const ToolSection({
    super.key,
    required this.sequenceController,
  });

  @override
  State<ToolSection> createState() => _ToolSectionState();
}

class _ToolSectionState extends State<ToolSection> {
  bool _isLoading = false;
  ProteinImprovementResult? _result;

  // Default example result to show before user submits
  ProteinImprovementResult get _defaultResult => ProteinImprovementResult(
        success: true,
        data: ProteinData(
          changedPosition: 1,
          originalAminoAcid: 'M',
          changedAminoAcid: 'F',
          tmChange: 12.08,
          optimizedSequence:
              'FGDVEKGKKIFVQKCAQCHTVEKGGKHKTGPNLHGLFGRKTGQAPGFTYTDANKNKGITWKEETLMEYLENPKKYIPGTKMIFAGIKKKTEREDLIAYLKKATNE',
          status: 'Improved',
        ),
      );

  Future<void> _improveSequence() async {
    if (widget.sequenceController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a protein sequence'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _result = null;
    });

    try {
      final response = await ApiService.improveProteinStability(
        proteinSequence: widget.sequenceController.text.trim(),
      );

      if (response != null) {
        final result = ProteinImprovementResult.fromJson(response);
        setState(() {
          _result = result;
        });

        if (result.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Protein sequence improved successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Failed to connect to the API. Please make sure the server is running.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Improve Your Protein',
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
                    controller: widget.sequenceController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText:
                          'Enter your protein sequences here...\n\n\n\nExample:\nMGDVEKGKKIFVQKCAQCHTVEKGGKHKTGPNLHGLFGRKTGQAPGFTYTDANKNKGITWKEETLMEYLENPKKYIPGTKMIFAGIKKKTEREDLIAYLKKATNE',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Courier',
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(20),
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
                    onPressed: _isLoading ? null : _improveSequence,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Text('Improve Sequence'),
                  ),
                ),

                // Results Widget - Show default example when no real result exists
                ResultsWidget(
                  result: _result ?? _defaultResult,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
