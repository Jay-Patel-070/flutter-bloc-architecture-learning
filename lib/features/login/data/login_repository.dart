import 'dart:convert';

import 'package:learningbloc/features/login/model/login_request_model.dart';
import 'package:learningbloc/features/login/model/login_response_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<LoginResponseModel> login(String username, String password) async {
    LoginRequestModel loginRequestModel = LoginRequestModel(
      username: username,
      password: password,
    );
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequestModel.toJson()),
    );
    try{
      if(response.statusCode == 200){
        return LoginResponseModel.fromJson(jsonDecode(response.body));
      }else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    }catch (e){
      print("exception is $e");
      throw Exception('Something went wrong during login');
    }
  }
}
