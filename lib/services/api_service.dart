import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://stable-protein.subnitro.pro';

  static Future<Map<String, dynamic>?> improveProteinStability({
    required String proteinSequence,
    double asa = -1,
    double ph = 7.0,
    double tm = 80.4,
    int coil = 0,
    int helix = 0,
    int sheet = 0,
    int turn = 0,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/improve-stability'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'ASA': asa,
          'pH': ph,
          'Tm_(C)': tm,
          'Coil': coil,
          'Helix': helix,
          'Sheet': sheet,
          'Turn': turn,
          'Protein_Sequence': proteinSequence,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error making API request: $e');
      return null;
    }
  }

  static Future<bool> checkApiHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      print('Error checking API health: $e');
      return false;
    }
  }
}
