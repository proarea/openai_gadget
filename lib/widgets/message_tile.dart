import 'package:flutter/material.dart';

import '../models/chat_message.dart';
import 'copy_button.dart';

class MessageTile extends StatelessWidget {
  final ChatMessage message;

  const MessageTile(
    this.message, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.type != ChatMessageType.request)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.computer),
                ),
              Expanded(
                child: _buildMessageBubble(context),
              ),
              if (message.type == ChatMessageType.request)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.person),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(BuildContext context) {
    final isUserMessage = message.type == ChatMessageType.request;
    final messageMargin = isUserMessage
        ? const EdgeInsets.only(left: 64)
        : const EdgeInsets.only(right: 64);
    const copyButtonPadding = EdgeInsets.only(right: 32);

    return Align(
      alignment: isUserMessage ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: messageMargin,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isUserMessage ? Colors.blue : Colors.blueGrey[200],
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8) + copyButtonPadding,
              child: Column(
                crossAxisAlignment: isUserMessage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildContent(context),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _buildCopyButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        message.content,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildCopyButton() {
    return CopyButton(
      text: message.content,
      size: 14,
    );
  }
}
