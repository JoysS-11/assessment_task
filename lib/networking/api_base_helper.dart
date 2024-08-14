import '../config/api_config.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  String baseUrl = ApiConfig.baseUrl;

  Future<dynamic> get(String? url) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$url'),
      );
      return response;
    } catch (e) {
      print('Error: $e');
    }
  }
}
