import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.31.1:5000';

  static Future<String> fetchMessage() async {
    print("Fetching message from the API...");
    final response = await http.get(Uri.parse('$baseUrl/api/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("Response data: ${data['message']}");
      return data['message'];
    } else {
      throw Exception('Failed to load message');
    }
  }
}
