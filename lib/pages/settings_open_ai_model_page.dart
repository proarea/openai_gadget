import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deps/blocs/motivational_bloc.dart';
import '../deps/blocs/settings_bloc.dart';
import '../di/locator.dart';
import '../generated/openai_models.dart';
import '../l10n/l10n.dart';
import '../models/app_settings.dart';
import '../models/open_ai_model.dart';
import '../widgets/constrained_area.dart';
import '../widgets/default_app_bar.dart';

class SettingsOpenAiModelPage extends StatefulWidget {
  static PageRoute createRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => locator<MotivationalBloc>(),
          child: const SettingsOpenAiModelPage(),
        );
      },
    );
  }

  const SettingsOpenAiModelPage({super.key});

  @override
  State<SettingsOpenAiModelPage> createState() =>
      _SettingsOpenAiModelPageState();
}

class _SettingsOpenAiModelPageState extends State<SettingsOpenAiModelPage> {
  void _onPicked(BuildContext context, OpenAiModel? openAiModel) {
    if (openAiModel == null) return;
    BlocProvider.of<SettingsBloc>(context).set(openAiModel: openAiModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.noActions(
        title: context.localizations.tooltipOpenAiTextModelPicker,
      ),
      body: ConstrainedArea(
        child: BlocBuilder<SettingsBloc, AppSettings>(
          builder: (BuildContext context, AppSettings appSettings) {
            const values = GeneratedOpenAiModels.textModels;

            return ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) {
                final value = values[index];
                final groupValue = appSettings.openAiModel;

                return RadioListTile(
                  value: value,
                  groupValue: groupValue,
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      value.model,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          if (value.modelFamily.isNotEmpty)
                            _buildChipLabel(value.modelFamily),
                          if (value.limit.isNotEmpty)
                            _buildChipLabel(value.limit),
                          if (value.trainingData.isNotEmpty)
                            _buildChipLabel(value.trainingData),
                          const TextSpan(text: "\r\n"),
                          TextSpan(text: value.description),
                        ],
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value == null) return;
                    _onPicked(context, value);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  InlineSpan _buildChipLabel(String label) {
    return WidgetSpan(
      baseline: TextBaseline.alphabetic,
      alignment: PlaceholderAlignment.baseline,
      child: Container(
        margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
