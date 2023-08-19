import 'package:flutter/material.dart';

import '../models/chat_message.dart';


class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback onDelete;

  const ChatBubble({required this.message, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(message.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        title: Text(message.text),
      ),
    );
  }
}
