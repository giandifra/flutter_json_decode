import 'package:flutter/material.dart';
import 'package:json_decode/post_model.dart';
import 'package:json_decode/utils.dart';

class StatelessHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Mode'),
      ),
      body: FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.data;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Text(posts[index].id.toString()),
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].body),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Post>> getPosts() async {
    final body = await Utils.getResponseBody();
    return Utils.parsePosts(body);
  }
}
