import 'dart:async';

import 'package:openai_client/openai_client.dart';

import '../../models/open_ai_model.dart';

class OpenAiService {
  final OpenAIClient openAiClient;

  const OpenAiService({
    required this.openAiClient,
  });

  Future<String> askForCompletion(
    OpenAiModel openAiModel,
    String prompt,
  ) async {
    final request = openAiClient.completions.create(
      model: openAiModel.model,
      prompt: prompt,
      maxTokens: 1000,
    );
    final response = await request.go();
    final choices = response.data?.choices ?? [];
    final botResponse = choices.map((c) => c.text).join('\n').trim();
    return botResponse;
  }
}
