import 'package:epam_homeworks/repository/post_repository_impl.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final _postRepository = PostRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo',
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: _postRepository.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.pop(context, snapshot.data?[index].title);
                  },
                  title: Text(snapshot.data?[index].title ?? 'null'),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
