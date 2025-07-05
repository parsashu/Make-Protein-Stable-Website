import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/tool_section.dart';
import '../widgets/examples_section.dart';
import '../widgets/footer_section.dart';

class ProteinStabilityHomePage extends StatefulWidget {
  const ProteinStabilityHomePage({super.key});

  @override
  State<ProteinStabilityHomePage> createState() =>
      _ProteinStabilityHomePageState();
}

class _ProteinStabilityHomePageState extends State<ProteinStabilityHomePage> {
  final TextEditingController _sequenceController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _sequenceController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            HeroSection(scrollController: _scrollController),

            // About Section
            const AboutSection(),

            // Tool Section
            ToolSection(sequenceController: _sequenceController),

            // Examples Section
            const ExamplesSection(),

            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
