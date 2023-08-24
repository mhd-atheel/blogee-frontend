import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technical/models/postModel.dart';

import '../variables.dart';

class PostService{
  static Future<String> createPost(PostModel postModel) async {
    final url = Variables.basePostUri+Variables.createPost;
    final uri = Uri.parse(url);
    var data = {
      "email": "rajeen@gmail.com",
      "password": "1234567sdas8"
    };
    final response = await http.post(uri,
        body: jsonEncode(postModel.toJson()),
        headers: {"Content-Type":"application/json"}
    );

    if (response.statusCode == 200) {
      print('Post Created successfully');
    }
    return 'Failed to register user';
    // final users = json.map((e) {
    //   return UserModel.fromJson(e);
    // }).toList();

  }
}