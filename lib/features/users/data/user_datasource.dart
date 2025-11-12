import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDatasource {
  Future<Map<String, dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load users");
    }
  }
}
