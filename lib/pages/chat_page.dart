import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deps/blocs/chat_bloc.dart';
import '../deps/blocs/settings_bloc.dart';
import '../di/locator.dart';
import '../l10n/l10n.dart';
import '../models/chat_message.dart';
import '../widgets/constrained_area.dart';
import '../widgets/message_tile.dart';
import '../widgets/open_ai_text_model_selector.dart';
import '../widgets/settings_option.dart';

class ChatPage extends StatefulWidget {
  static PageRoute createRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => locator<ChatBloc>(),
          child: const ChatPage(),
        );
      },
    );
  }

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final TextEditingController _controller;
  late final FocusNode _inputFieldFocusNode;

  SettingsBloc get _settingsBloc => BlocProvider.of<SettingsBloc>(context);
  ChatBloc get _bloc => BlocProvider.of<ChatBloc>(context);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _inputFieldFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      FocusScope.of(context).requestFocus(_inputFieldFocusNode);
    });
  }

  @override
  void dispose() {
    _inputFieldFocusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    _controller.clear();
    _inputFieldFocusNode.requestFocus();
    setState(() {});

    final settings = _settingsBloc.state;
    _bloc.postMessage(settings.textModel, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenAI Completion Demo'),
      ),
      body: ConstrainedArea(
        child: Column(
          children: [
            _buildSettingsRow(),
            Expanded(
              child: _buildMessagesRow(),
            ),
            _buildInputRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsRow() {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SettingsOption(
                label: context.localizations.labelTextModelName,
                child: OpenAiTextModelSelector(
                  onChanged: () {
                    FocusScope.of(context).requestFocus(_inputFieldFocusNode);
                  },
                ),
              ),
              SettingsOption(
                label: context.localizations.labelClearChatHistory,
                child: IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: () => _bloc.clearChat(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessagesRow() {
    return BlocBuilder<ChatBloc, List<ChatMessage>>(
      bloc: _bloc,
      builder: (context, messages) {
        if (messages.isEmpty) {
          return const Center(
            child: Text('Type in whatever you would like to ask'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(4),
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (_, index) {
            return MessageTile(messages[index]);
          },
        );
      },
    );
  }

  Widget _buildInputRow() {
    return BlocBuilder<ChatBloc, List<ChatMessage>>(
      bloc: _bloc,
      builder: (context, messages) {
        final isLastMessageARequest =
            messages.firstOrNull?.type == ChatMessageType.request;
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  focusNode: _inputFieldFocusNode,
                  onSubmitted:
                      isLastMessageARequest ? null : (_) => _onSubmit(),
                  textInputAction: TextInputAction.send,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLastMessageARequest
                  ? _buildLoadingSubmitButton()
                  : IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _onSubmit,
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingSubmitButton() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        Visibility(
          visible: false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: IconButton(
            icon: Icon(Icons.send),
            onPressed: null,
          ),
        ),
        Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }
}
