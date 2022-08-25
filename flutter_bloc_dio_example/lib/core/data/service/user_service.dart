import 'package:dio/dio.dart';

import '../../model/model.dart';

class UserService {
  List<Post> posts = [];
  Future<Post?> getPost() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    try {
      final response = await Dio().get(url);
      final activity = Post.fromJson(response.data);
      return activity;
    } catch (e) {
      print(e);
    }
  }
}
