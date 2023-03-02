import "../models/open_ai_model.dart";
import 'openai_models/openai_models_codex.dart' as codex;
import 'openai_models/openai_models_gpt3.dart' as gpt3;
import 'openai_models/openai_models_gpt3_5.dart' as gpt3_5;
// import 'openai_models/openai_models_gpt3_5_chat.dart' as gpt3_5_chat;

class GeneratedOpenAiModels {
  static const List<OpenAiModel> textModels = [
    ...gpt3_5.models,
    ...gpt3.models,
    ...codex.models,
  ];
}
