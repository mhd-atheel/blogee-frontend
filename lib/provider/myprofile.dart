import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/postModel.dart';
import '../services/postService.dart';

class MyProfile {

  final postDataProvider = FutureProvider<List<PostModel>>((ref) async {
    return ref.watch(postProvider).fetchPost();
  });


}