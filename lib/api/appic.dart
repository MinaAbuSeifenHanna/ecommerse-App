import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiClient {
  static const baseUrl = 'https://fakestoreapi.com';

  // Login method
  static Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      print('log paavly');
      print(response.body);
      final responseData = jsonDecode(response.body);
      final token = responseData['token'];
      final userId = responseData['id']; // Assuming the API response provides the user ID as 'id'
      TokenStorage.token = token;
      TokenStorage.userId = userId;
      print(userId);
      return true;
    } else {
      print('log paavly error');
      return false;
    }
  }


  // Get user data method
  static Future<Map<String, dynamic>> getUserData() async {
    final userId = TokenStorage.userId;
    if (userId != null) {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId'),
        headers: {'Authorization': 'Bearer ${TokenStorage.token}'},
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to get user data');
      }
    } else {
      throw Exception('User ID not found');
    }
  }

  // Logout method
  static void logout() {
    // Clear the saved token
    TokenStorage.token = null;
  }
}

class TokenStorage {
  static String? token;
  static int? userId; // Add a variable to store the user ID
}