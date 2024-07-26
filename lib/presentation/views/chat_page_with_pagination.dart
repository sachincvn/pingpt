import 'package:flutter/material.dart';
import 'package:pingpt/core/utils/styles.dart';
import 'package:pingpt/presentation/widgets/app_bar_widget.dart';
import 'package:pingpt/core/common/constants.dart';

class PaginationChatScreen extends StatefulWidget {
  const PaginationChatScreen({super.key});

  @override
  State<PaginationChatScreen> createState() => _PaginationChatScreenState();
}

class _PaginationChatScreenState extends State<PaginationChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<MessageTemplateModel> _messages = [];
  bool _isLoading = false;
  int _offset = 0;
  final int _limit = 20;

  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchMessages() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    final newMessages = chatMessages.skip(_offset).take(_limit).toList();

    setState(() {
      _messages.addAll(newMessages);
      _offset += _limit;
      _isLoading = false;
    });
  }

  void _fetchMoreMessages() {
    if (!_isLoading) {
      _fetchMessages();
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      _fetchMoreMessages();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: _isLoading && _messages.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: _messages.length + (_isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == _messages.length) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final message = _messages[index];
                          return Align(
                            alignment: message.sent
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: message.sent
                                    ? Colors.blueAccent
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                message.content,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
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
    );
  }
}
