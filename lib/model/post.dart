class Post {
  const Post({required this.title});

  final String title;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
      );
}
