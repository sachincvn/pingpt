import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pingpt/core/utils/styles.dart';
import 'package:pingpt/presentation/viewmodels/chat_viewmodel.dart';
import 'package:pingpt/presentation/widgets/app_bar_widget.dart';
import 'package:pingpt/presentation/widgets/response_message_widget.dart';
import 'package:pingpt/presentation/widgets/sent_message_widget.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatViewModel _chatViewModel;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chatViewModel = GetIt.instance<ChatViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _chatViewModel,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            gradient: AppTheme.gradientBackground(),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppBarWidget(),
                Expanded(
                  child: Consumer<ChatViewModel>(
                    builder: (context, viewModel, child) {
                      final messages = viewModel.messages;
                      if (messages.isEmpty) {
                        return const Center(
                          child: Text(
                            "No chat found!",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: message.isGenerating
                                  ? const Text('Generating...',
                                      style: TextStyle(color: Colors.grey))
                                  : message.isSent
                                      ? SentMessageWidget(
                                          message: message.content)
                                      : ResponseMessageWidget(
                                          message: message.content),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            _chatViewModel.fetchMessages(value);
                            _controller.clear();
                          }
                        },
                        style: const TextStyle(color: AppTheme.secondaryColor),
                        decoration:
                            const InputDecoration(hintText: "Enter something"),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final message = _controller.text.trim();
                        if (message.isNotEmpty) {
                          _chatViewModel.fetchMessages(message);
                          _controller.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
