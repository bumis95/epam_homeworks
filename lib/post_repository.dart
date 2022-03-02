import 'package:epam_homeworks/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
