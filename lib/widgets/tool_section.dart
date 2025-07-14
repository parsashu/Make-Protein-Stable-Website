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
  bool _hasInitializedSequence = false;

  // Controllers for new text fields
  final TextEditingController _phController = TextEditingController(text: '6');
  final TextEditingController _asaController = TextEditingController(text: '9');

  // Checkbox states
  bool _coilChecked = true; // Default to true
  bool _helixChecked = false;
  bool _sheetChecked = false;
  bool _turnChecked = false;

  @override
  void initState() {
    super.initState();
    // Set the example sequence only once when the widget is first created
    if (!_hasInitializedSequence) {
      widget.sequenceController.text =
          'MGDVEKGKKIFVQKCAQCHTVEKGGKHKTGPNLHGLFGRKTGQAPGFTYT';
      _hasInitializedSequence = true;
    }
  }

  @override
  void dispose() {
    _phController.dispose();
    _asaController.dispose();
    super.dispose();
  }

  // Default example result to show before user submits
  ProteinImprovementResult get _defaultResult => ProteinImprovementResult(
        success: true,
        data: ProteinData(
          changedPosition: 3,
          originalAminoAcid: 'D',
          changedAminoAcid: 'E',
          tmChange: 5.29,
          optimizedSequence:
              'MGEVEKGKKIFVQKCAQCHTVEKGGKHKTGPNLHGLFGRKTGQAPGFTYT',
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
      // Parse pH and ASA values with defaults
      double ph = 7.0; // Default when null
      double asa = -1.0; // Default when null

      if (_phController.text.isNotEmpty) {
        ph = double.tryParse(_phController.text) ?? 7.0;
      }

      if (_asaController.text.isNotEmpty) {
        asa = double.tryParse(_asaController.text) ?? -1.0;
      }

      final response = await ApiService.improveProteinStability(
        proteinSequence: widget.sequenceController.text.trim(),
        ph: ph,
        asa: asa,
        coil: _coilChecked ? 1 : 0,
        helix: _helixChecked ? 1 : 0,
        sheet: _sheetChecked ? 1 : 0,
        turn: _turnChecked ? 1 : 0,
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
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 768;
    final isMediumScreen = screenSize.width < 1024;

    // Responsive padding and constraints
    final sectionPadding =
        isSmallScreen ? 20.0 : (isMediumScreen ? 40.0 : 80.0);
    final maxWidth = isSmallScreen ? double.infinity : 1000.0;

    return Container(
      padding: EdgeInsets.all(sectionPadding),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Improve Your Protein',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isSmallScreen ? 24 : (isMediumScreen ? 28 : 32),
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 24 : 40),
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Protein Sequence',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: isSmallScreen ? 16 : 18,
                      ),
                ),
                SizedBox(height: isSmallScreen ? 12 : 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: TextField(
                    key: const Key('protein_sequence_input'),
                    maxLines: isSmallScreen ? 4 : 6,
                    decoration: InputDecoration(
                      hintText: 'Enter your protein sequences here...',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Courier',
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                    ),
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                    controller: widget.sequenceController,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 20 : 24),

                // pH and ASA input fields
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Environment pH',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: isSmallScreen ? 14 : 16,
                                    ),
                          ),
                          SizedBox(height: isSmallScreen ? 8 : 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: TextField(
                              controller: _phController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.all(isSmallScreen ? 12 : 16),
                              ),
                              style: TextStyle(
                                fontSize: isSmallScreen ? 14 : 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: isSmallScreen ? 16 : 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ASA',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: isSmallScreen ? 14 : 16,
                                    ),
                          ),
                          SizedBox(height: isSmallScreen ? 8 : 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: TextField(
                              controller: _asaController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.all(isSmallScreen ? 12 : 16),
                              ),
                              style: TextStyle(
                                fontSize: isSmallScreen ? 14 : 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isSmallScreen ? 20 : 24),

                // Protein structure checkboxes
                Text(
                  'Protein Secondary Structure',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                ),
                SizedBox(height: isSmallScreen ? 12 : 16),

                Wrap(
                  spacing: isSmallScreen ? 8 : 16,
                  runSpacing: isSmallScreen ? 8 : 12,
                  children: [
                    _buildCheckbox(
                      'Coil',
                      _coilChecked,
                      (value) => setState(() => _coilChecked = value ?? false),
                      isSmallScreen,
                    ),
                    _buildCheckbox(
                      'Helix',
                      _helixChecked,
                      (value) => setState(() => _helixChecked = value ?? false),
                      isSmallScreen,
                    ),
                    _buildCheckbox(
                      'Sheet',
                      _sheetChecked,
                      (value) => setState(() => _sheetChecked = value ?? false),
                      isSmallScreen,
                    ),
                    _buildCheckbox(
                      'Turn',
                      _turnChecked,
                      (value) => setState(() => _turnChecked = value ?? false),
                      isSmallScreen,
                    ),
                  ],
                ),

                SizedBox(height: isSmallScreen ? 20 : 24),

                Center(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _improveSequence,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 24 : 32,
                        vertical: isSmallScreen ? 14 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: isSmallScreen ? 18 : 20,
                            width: isSmallScreen ? 18 : 20,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Improve Sequence',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

  Widget _buildCheckbox(String label, bool value, ValueChanged<bool?> onChanged,
      bool isSmallScreen) {
    return SizedBox(
      width: isSmallScreen ? 100 : 120,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
