import 'dart:convert';

import 'package:epam_homeworks/model/post.dart';
import 'package:epam_homeworks/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);

      return jsonList.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
