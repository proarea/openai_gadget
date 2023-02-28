import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deps/blocs/motivational_bloc.dart';
import '../deps/blocs/settings_bloc.dart';
import '../di/locator.dart';
import '../l10n/l10n.dart';
import '../widgets/constrained_area.dart';
import '../widgets/copy_button.dart';
import '../widgets/default_app_bar.dart';

class MotivationalPage extends StatefulWidget {
  static PageRoute createRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => locator<MotivationalBloc>(),
          child: const MotivationalPage(),
        );
      },
    );
  }

  const MotivationalPage({super.key});

  @override
  State<MotivationalPage> createState() => _MotivationalPageState();
}

class _MotivationalPageState extends State<MotivationalPage> {
  SettingsBloc get _settingsBloc => BlocProvider.of<SettingsBloc>(context);
  MotivationalBloc get _bloc => BlocProvider.of<MotivationalBloc>(context);

  void _onGenerate() async {
    final settings = _settingsBloc.state;
    final localizations = await AppLocalizations.delegate.load(settings.locale);
    _bloc.generate(settings.textModel, localizations.langName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: context.localizations.labelSimpleChat,
      ),
      body: ConstrainedArea(
        child: Column(
          children: [
            Expanded(
              child: _buildAffirmation(),
            ),
            _buildControlsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildAffirmation() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: BlocBuilder<MotivationalBloc, MotivationalBlocState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.errorOccured) {
            return Center(
              child: AutoSizeText(
                context.localizations.labelMotivationalTextError,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state.generating) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state.result.isEmpty) {
            return Center(
              child: AutoSizeText(
                context.localizations.labelMotivationalTextEmpty,
                textAlign: TextAlign.center,
              ),
            );
          }

          return Center(
            child: AutoSizeText(
              state.result,
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  Widget _buildControlsRow() {
    return BlocBuilder<MotivationalBloc, MotivationalBlocState>(
      bloc: _bloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                tooltip: context.localizations.labelGenerate,
                onPressed: state.generating ? null : _onGenerate,
              ),
              CopyButton(
                text: state.result,
                enabled: !state.generating &&
                    !state.errorOccured &&
                    state.result.isNotEmpty,
              ),
            ],
          ),
        );
      },
    );
  }
}
