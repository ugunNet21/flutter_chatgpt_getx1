import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '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';
  
  Future<String> getResponse(String inputText) async {
    print(Response());
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {'Authorization': 'Bearer $apiKey'},
      body: {'prompt': inputText, 'max_tokens': '50'},
    );

    if (response.statusCode == 200) {
      print("Response Body: ${response.body}");
      return response.body;
    } else {
      throw Exception('Failed to fetch response');
    }
  }
}
