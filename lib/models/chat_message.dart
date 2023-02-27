enum ChatMessageType { response, request, error }

class ChatMessage {
  final ChatMessageType type;
  final String content;

  const ChatMessage({
    required this.content,
    required this.type,
  });

  const ChatMessage.my({
    required this.content,
  }) : type = ChatMessageType.request;

  const ChatMessage.ai({
    required this.content,
  }) : type = ChatMessageType.response;

  @override
  String toString() => 'ChatMessage(content: $content, type: $type)';
}
