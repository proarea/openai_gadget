import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/chat_message.dart';

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
    final alignmentToEnd = message.type == ChatMessageType.request;

    return Align(
      alignment: alignmentToEnd ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey[200],
        ),
        child: Stack(
          children: [
            Container(
              padding:
                  const EdgeInsets.all(8) + const EdgeInsets.only(right: 32),
              child: Column(
                crossAxisAlignment: message.type == ChatMessageType.request
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
    return IconButton(
      icon: const Icon(
        Icons.copy,
        size: 14,
      ),
      onPressed: () {
        Clipboard.setData(
          ClipboardData(
            text: message.content,
          ),
        );
      },
    );
  }
}
