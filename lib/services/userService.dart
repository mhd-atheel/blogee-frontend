import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical/models/userModel.dart';
import 'package:technical/variables.dart';

class UserServices {

  static Future<List<UserModel>> fetchUser() async {
    final url = Variables.baseUserUri+Variables.getUsers;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as List<dynamic>;
    final users = json.map((e) {
      return UserModel.fromJson(e);
    }).toList();
    return users;
  }

  static Future<String> loginUser(UserModel userModel) async {
    final url = Variables.baseUserUri+Variables.loginUser;
    final uri = Uri.parse(url);
    var data = {
      "email": "rajeen@gmail.com",
      "password": "1234567sdas8"
    };
    final response = await http.post(uri,
        body: jsonEncode(userModel.toJson()),
        headers: {"Content-Type":"application/json"}
    );

    if (response.statusCode == 200) {
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      final json = jsonDecode(response.body) as Map<String,dynamic>;
      preferences.setString('id', json['_id']);
      preferences.setString('username', json['username']);
      preferences.setString('email', json['email']);
      print('User Login successfully');

    }
    return 'Failed to register user';
    // final users = json.map((e) {
    //   return UserModel.fromJson(e);
    // }).toList();

  }

  static Future<String> signUpUser(UserModel userModel) async {
    final url = Variables.baseUserUri+Variables.signUpUser;
    final uri = Uri.parse(url);
    // var data = {
    //   "username": "Rajeen",
    //   "email": "rajeen@gmail.com",
    //   "password": "1234567sdas8"
    // };
    final response = await http.post(uri,
        body: jsonEncode(userModel.toJson()),
        headers: {"Content-Type":"application/json"}
    );
    if (response.statusCode == 200) {
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      final json = jsonDecode(response.body) as Map<String,dynamic>;
      preferences.setString('id', json['_id']);
      preferences.setString('username', json['username']);
      preferences.setString('email', json['email']);
      print('User registered successfully');

    }
    return 'Failed to register user';

    // final json = jsonDecode(body) as Map<String,dynamic>;
    // print(json['_id']);
    // print(json['email']);
    // print(json['username']);
    // print(response.statusCode);
    // final users = json.map((e) {
    //   return UserModel.fromJson(e);
    // }).toList();

  }


}





// {
// // "username": "Meera33w",
// "email": "meera33w@gmail.com",
// "password": "1234567sdas8"
// }