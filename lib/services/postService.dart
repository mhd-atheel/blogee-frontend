import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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

    }
    return 'Failed to register user';
    // final users = json.map((e) {
    //   return UserModel.fromJson(e);
    // }).toList();

  }


   Future<List<PostModel>> fetchPost() async {
    final url = Variables.basePostUri+Variables.getPost;
    final uri = Uri.parse(url);
    var data = {
      "type": "all"
    };
    final response = await http.post(uri,
      body: jsonEncode(data) ,
        headers: {"Content-Type":"application/json"}
    );

    final body = response.body;
    final List<dynamic> json = await jsonDecode(body);
    if(response.statusCode ==200){
    return json.map(((e) => PostModel.fromJson(e))).toList();

    }else{
      throw Exception(response.reasonPhrase);
    }
    // final posts =  json.map((e) {
    //   return PostModel.fromJson(e);
    // }).toList();
    // print(posts);
    // return posts;

  }

  Future<List<PostModel>> fetchPostByUserId() async {
    const url = Variables.basePostUri+Variables.getPostByUserId;
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final uri = Uri.parse(url);
    var data = {
      "userid": preferences.getString('id')
    };
    final response = await http.post(uri,
        body: jsonEncode(data) ,
        headers: {"Content-Type":"application/json"}
    );

    final body = response.body;
    final List<dynamic> json = await jsonDecode(body);
    if(response.statusCode ==200){
      return json.map(((e) => PostModel.fromJson(e))).toList();

    }else{
      throw Exception(response.reasonPhrase);
    }
    // final posts =  json.map((e) {
    //   return PostModel.fromJson(e);
    // }).toList();
    // print(posts);
    // return posts;

  }


}
  final postProvider=Provider<PostService>((ref)=>PostService());


