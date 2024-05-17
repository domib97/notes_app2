import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes_app2/inspiration/1/models/chat_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a0363fbad07b4019a43215712230401';
  Future<ChatModel?> getChat() async {
    ChatModel? chatData;
    try {
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=days=4');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      chatData = ChatModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return chatData;
  }
}
