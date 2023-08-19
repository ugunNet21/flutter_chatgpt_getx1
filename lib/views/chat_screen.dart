import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../widgets/chat_bubble.dart';



class ChatScreen extends StatelessWidget {
  final ChatController _chatController = Get.find();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (_chatController.isLoading.value) {
                return Center(child: CircularProgressIndicator()); // Menampilkan loading indicator jika isLoading true
              } else {
                return ListView.builder(
                  itemCount: _chatController.messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      message: _chatController.messages[index],
                      onDelete: () => _chatController.deleteMessage(index),
                    );
                  },
                );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    String inputText = _messageController.text;
                    _messageController.clear(); // Kosongkan teks di controller setelah mengirim
                    
                    String response = await _chatController.getChatResponse(inputText);
                    _chatController.addMessage(response);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// class ChatScreen extends StatelessWidget {
//   final ChatController _chatController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ChatGPT App'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (_chatController.isLoading.value) {
//                 return Center(child: CircularProgressIndicator()); // Menampilkan loading indicator jika isLoading true
//               } else {
//                 return ListView.builder(
//                   itemCount: _chatController.messages.length,
//                   itemBuilder: (context, index) {
//                     return ChatBubble(
//                       message: _chatController.messages[index],
//                       onDelete: () => _chatController.deleteMessage(index),
//                     );
//                   },
//                 );
//               }
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     onChanged: _chatController.addMessage,
//                     decoration: InputDecoration(
//                       hintText: 'Type a message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () async {
//                     String response = await _chatController.getChatResponse(_chatController.messages.last.text);
//                     _chatController.addMessage(response);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
