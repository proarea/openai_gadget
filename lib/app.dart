import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'deps/blocs/settings_bloc.dart';
import 'di/locator.dart';
import 'l10n/l10n.dart';
import 'pages/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (_) => locator<SettingsBloc>(),
        ),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => context.localizations.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: const SplashPage(),
      ),
    );
  }
}
