import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chat_message.dart';
import '../../models/open_ai_model.dart';
import '../services/open_ai_service.dart';

class ChatBloc extends Cubit<List<ChatMessage>> {
  final OpenAiService openAiService;

  ChatBloc({
    required this.openAiService,
  }) : super([]);

  void clearChat() {
    if (isClosed) return;
    emit([]);
  }

  void postMessage(OpenAiModel openAiModel, String prompt) async {
    final userMessage = ChatMessage.my(content: prompt);
    if (isClosed) return;
    emit([userMessage, ...state]);

    final response = await _respond(openAiModel, prompt);
    if (isClosed) return;
    emit([response, ...state]);
  }

  Future<ChatMessage> _respond(OpenAiModel openAiModel, String prompt) async {
    try {
      final response = await openAiService.askForCompletion(
        openAiModel,
        prompt,
      );

      if (response.isEmpty) {
        const errorMessage = 'I do not know how to respond to that';

        return const ChatMessage.ai(content: errorMessage);
      } else {
        return ChatMessage.ai(content: response);
      }
    } catch (e) {
      return ChatMessage(content: '$e', type: ChatMessageType.error);
    }
  }
}
