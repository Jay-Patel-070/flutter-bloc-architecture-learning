import 'dart:convert';

import 'package:learningbloc/features/users/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserModel> getUsers() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));
    try{
      if(response.statusCode == 200){
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
    }catch (e){
      print("Exception $e");
      throw Exception(e.toString());
    }
  }
}
