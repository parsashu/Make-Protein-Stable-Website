import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/scientific_background_section.dart';
import '../widgets/tool_section.dart';
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
  final GlobalKey _toolSectionKey = GlobalKey();

  @override
  void dispose() {
    _sequenceController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 768;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            HeroSection(
              scrollController: _scrollController,
              toolSectionKey: _toolSectionKey,
            ),

            // About Section
            const AboutSection(),

            // Scientific Background Section
            const ScientificBackgroundSection(),

            // Tool Section
            ToolSection(
              key: _toolSectionKey,
              sequenceController: _sequenceController,
            ),

            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
