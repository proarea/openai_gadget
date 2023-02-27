import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/app_settings.dart';
import '../../models/open_ai_text_model.dart';

class SettingsBloc extends Cubit<AppSettings> {
  SettingsBloc() : super(const AppSettings.defaults());

  void setModel(OpenAiTextModel textModel) {
    if (isClosed) return;
    emit(state.copyWith(textModel: textModel));
  }
}
