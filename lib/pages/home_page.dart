import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../widgets/constrained_area.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  static PageRoute createRoute() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.appName),
      ),
      body: ConstrainedArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(context.localizations.labelGoToSimpleChat),
              leading: const Icon(Icons.chat),
              onTap: () => Navigator.of(context).push(ChatPage.createRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
