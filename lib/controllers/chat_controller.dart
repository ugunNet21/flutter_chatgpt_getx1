import 'package:get/get.dart';

import '../data/api_service.dart';
import '../models/chat_message.dart';

class ChatController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList messages = [].obs;
  final RxBool isLoading = false.obs;

  void addMessage(String text) {
    messages.add(ChatMessage(id: DateTime.now().toString(), text: text));
    update();
  }

  void deleteMessage(int index) {
    messages.removeAt(index);
    update();
  }

  Future<String> getChatResponse(String inputText) async {
    isLoading.value = true;
    try {
      String response = await _apiService.getResponse(inputText);
      print("Chat Response: $response");
      return response;
    } catch (e) {
      return 'Error fetching response';
    } finally {
      isLoading.value =
          false; // Set isLoading kembali ke false setelah respons diterima
    }
  }
}
