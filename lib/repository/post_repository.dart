import 'package:epam_homeworks/model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
