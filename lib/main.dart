import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/routes/app_routes.dart';
import 'package:flutter_chatgpt/views/chat_screen.dart';
import 'package:get/get.dart';

import 'controllers/chat_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChatGPT App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.CHAT_SCREEN,
      getPages: [
        GetPage(
          name: Routes.CHAT_SCREEN,
          page: () => ChatScreen(),
        ),
        // Add more pages here if needed
      ],
    );
  }
}
