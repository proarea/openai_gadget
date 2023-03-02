import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../widgets/constrained_area.dart';
import '../widgets/default_app_bar.dart';
import 'chat_page.dart';
import 'motivational_page.dart';
import 'settings_open_ai_model_page.dart';

class HomePage extends StatelessWidget {
  static PageRoute createRoute() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: context.localizations.appName,
      ),
      body: ConstrainedArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(context.localizations.labelGoToSimpleChat),
              leading: const Icon(Icons.chat),
              onTap: () => Navigator.of(context).push(
                ChatPage.createRoute(),
              ),
            ),
            ListTile(
              title: Text(context.localizations.labelGoToMotivationals),
              leading: const Icon(Icons.sentiment_very_satisfied_rounded),
              onTap: () => Navigator.of(context).push(
                MotivationalPage.createRoute(),
              ),
            ),
            ListTile(
              title: Text(context.localizations.tooltipOpenAiTextModelPicker),
              leading: const Icon(Icons.settings),
              onTap: () => Navigator.of(context).push(
                SettingsOpenAiModelPage.createRoute(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
