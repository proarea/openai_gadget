import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deps/blocs/chat_bloc.dart';
import '../deps/blocs/settings_bloc.dart';
import '../di/locator.dart';
import '../l10n/l10n.dart';
import '../models/chat_message.dart';
import '../widgets/constrained_area.dart';
import '../widgets/default_app_bar.dart';
import '../widgets/message_tile.dart';

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
      appBar: DefaultAppBar(
        title: context.localizations.labelSimpleChat,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: context.localizations.tooltipClearChat,
            onPressed: () => _bloc.clearChat(),
          ),
        ],
      ),
      body: ConstrainedArea(
        child: Column(
          children: [
            Expanded(
              child: _buildMessages(),
            ),
            _buildInputRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessages() {
    return BlocBuilder<ChatBloc, List<ChatMessage>>(
      bloc: _bloc,
      builder: (context, messages) {
        if (messages.isEmpty) {
          return Center(
            child: Text(context.localizations.labelEmptyChat),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 32),
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
        return Card(
          margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInputField(
                    onSubmitted:
                        isLastMessageARequest ? null : (_) => _onSubmit(),
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField({required ValueChanged<String>? onSubmitted}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        focusNode: _inputFieldFocusNode,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.send,
      ),
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
