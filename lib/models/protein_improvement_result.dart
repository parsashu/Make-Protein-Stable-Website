class ProteinImprovementResult {
  final bool success;
  final String? error;
  final ProteinData? data;

  ProteinImprovementResult({
    required this.success,
    this.error,
    this.data,
  });

  factory ProteinImprovementResult.fromJson(Map<String, dynamic> json) {
    return ProteinImprovementResult(
      success: json['success'] ?? false,
      error: json['error'],
      data: json['data'] != null ? ProteinData.fromJson(json['data']) : null,
    );
  }
}

class ProteinData {
  final int changedPosition;
  final String originalAminoAcid;
  final String changedAminoAcid;
  final double tmChange;
  final String optimizedSequence;
  final String status;

  ProteinData({
    required this.changedPosition,
    required this.originalAminoAcid,
    required this.changedAminoAcid,
    required this.tmChange,
    required this.optimizedSequence,
    required this.status,
  });

  factory ProteinData.fromJson(Map<String, dynamic> json) {
    return ProteinData(
      changedPosition: json['changed_position'] ?? 0,
      originalAminoAcid: json['original_amino_acid'] ?? '',
      changedAminoAcid: json['changed_amino_acid'] ?? '',
      tmChange: (json['tm_change'] ?? 0.0).toDouble(),
      optimizedSequence: json['optimized_sequence'] ?? '',
      status: json['status'] ?? 'Improved',
    );
  }
}
