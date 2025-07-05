import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const ProteinStabilityApp());
}

class ProteinStabilityApp extends StatelessWidget {
  const ProteinStabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make Protein Stable',
      theme: AppTheme.lightTheme,
      home: const ProteinStabilityHomePage(),
    );
  }
}
