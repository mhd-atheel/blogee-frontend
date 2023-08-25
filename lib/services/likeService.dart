import 'dart:convert';

import '../variables.dart';
import 'package:http/http.dart' as http;

class LikeService{
  static Future<String> createLike(String userId ,String postId) async {
    final url = Variables.baseLikeUri+Variables.createLike;
    final uri = Uri.parse(url);
    var data = {
      "userid": userId,
      "postid": postId
    };
    final response = await http.post(uri,
        body: jsonEncode(data),
        headers: {"Content-Type":"application/json"}
    );

    if (response.statusCode == 200) {
      print('liked successfully');
      return 'liked successfully';
    }
    return 'Failed to create like';
    // final users = json.map((e) {
    //   return UserModel.fromJson(e);
    // }).toList();

  }


  static Future<String> deleteLike(String userId ,String postId) async {
    final url = Variables.baseLikeUri+Variables.deleteLike;
    final uri = Uri.parse(url);
    var data = {
      "userid": userId,
      "postid": postId
    };
    final response = await http.post(uri,
        body: jsonEncode(data),
        headers: {"Content-Type":"application/json"}
    );

    if (response.statusCode == 200) {
      print('Like deleted successfully');
      return 'Like deleted successfully';
    }
    return 'Failed to delete like';
    // final users = json.map((e) {
    //   return UserModel.fromJson(e);
    // }).toList();

  }
}