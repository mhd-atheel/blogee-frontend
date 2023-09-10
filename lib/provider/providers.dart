import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical/models/postModel.dart';
import 'package:technical/models/userModel.dart';
import 'package:technical/services/userService.dart';

import '../services/postService.dart';

final postDataProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.watch(postProvider).fetchPost();
});

final postDataByIdProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.watch(postProvider).fetchPostByUserId();
});

final userDataProvider = FutureProvider<List<UserModel>?>((ref) async {
  return ref.watch(userProvider).fetchUser();
});
