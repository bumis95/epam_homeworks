import 'dart:convert';

import 'package:epam_homeworks/post.dart';
import 'package:epam_homeworks/post_repository.dart';
import 'package:http/http.dart' as http;

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<Post> posts = [];
      List responseJson = jsonDecode(response.body);
      responseJson.map((e) => posts.add(Post.fromJson(e))).toList();
      return posts;
    } else {
      throw Exception('Failed to load');
    }
  }
}
