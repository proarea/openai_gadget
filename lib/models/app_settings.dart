// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'open_ai_text_model.dart';

class AppSettings {
  final OpenAiTextModel textModel;

  const AppSettings({
    required this.textModel,
  });

  const AppSettings.defaults() : textModel = OpenAiTextModel.davinci;

  AppSettings copyWith({
    OpenAiTextModel? textModel,
  }) {
    return AppSettings(
      textModel: textModel ?? this.textModel,
    );
  }

  @override
  bool operator ==(covariant AppSettings other) {
    if (identical(this, other)) return true;

    return other.textModel == textModel;
  }

  @override
  int get hashCode => textModel.hashCode;
}
