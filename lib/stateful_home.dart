import 'package:flutter/material.dart';
import 'package:json_decode/post_model.dart';
import 'package:json_decode/utils.dart';

class StatefulHome extends StatefulWidget {
  StatefulHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatefulHomeState createState() => _StatefulHomeState();
}

class _StatefulHomeState extends State<StatefulHome> {
  List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cloud_download),
            onPressed: () async {
              final body = await Utils.getResponseBody();
              if (body != null) {
                setState(() {
                  posts = Utils.parsePosts(body);
                });
              }
            },
          )
        ],
      ),
      body: posts == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Text(posts[index].id.toString()),
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body),
                );
              }),
    );
  }
}
