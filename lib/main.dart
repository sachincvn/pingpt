import 'package:flutter/material.dart';
import 'package:pingpt/presentation/viewmodels/pagination_demo_viewmodel.dart';
import 'package:pingpt/presentation/views/chat_page_with_pagination.dart';
import 'package:provider/provider.dart';
import 'package:pingpt/core/services/service_locator.dart' as di;
import 'package:pingpt/core/utils/styles.dart';
import 'package:pingpt/presentation/viewmodels/chat_viewmodel.dart';

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.sl<ChatViewModel>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PinGPT',
        theme: AppTheme.lightTheme,
        home: const PaginationChatScreen(),
      ),
    );
  }
}
