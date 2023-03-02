import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../widgets/constrained_area.dart';
import '../widgets/default_app_bar.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(HomePage.createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.noActions(
        title: context.localizations.appName,
      ),
      body: const ConstrainedArea(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
