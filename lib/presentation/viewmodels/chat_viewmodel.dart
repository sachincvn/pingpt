import 'package:flutter/material.dart';
import 'package:pingpt/domain/usecases/get_messages.dart';

class ChatViewModel extends ChangeNotifier {
  final GetMessages _getMessages;
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  ChatViewModel({required GetMessages getMessages})
      : _getMessages = getMessages;

  void fetchMessages(String query) {
    _messages
        .add(ChatMessage(content: query, isSent: true, isGenerating: false));
    _messages.add(ChatMessage(
        content: "Generating..", isSent: false, isGenerating: false));
    notifyListeners();

    _getMessages.call(query).listen(
      (result) {
        result.fold(
          (failure) {
            _messages[_messages.length - 1] = (ChatMessage(
              content: 'Error: ${failure.toString()}',
              isSent: false,
              isGenerating: false,
            ));
            notifyListeners();
          },
          (message) {
            _messages[_messages.length - 1] = (ChatMessage(
              content: message.content,
              isSent: false,
              isGenerating: false,
            ));
            notifyListeners();
          },
        );
      },
      onError: (error) {
        _messages.add(ChatMessage(
          content: 'Unexpected error: $error',
          isSent: false,
          isGenerating: false,
        ));
        notifyListeners();
      },
    );
  }
}

class ChatMessage {
  final String content;
  final bool isSent;
  final bool isGenerating;

  ChatMessage({
    required this.content,
    required this.isSent,
    required this.isGenerating,
  });
}
