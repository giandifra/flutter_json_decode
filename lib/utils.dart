import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_decode/post_model.dart';

class Utils{

  static Future<String> getResponseBody() async {
    final String url = "https://jsonplaceholder.typicode.com/posts";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static List<Post> parsePosts(String body) {
    final parsed = json.decode(body);
    return parsed.map<Post>((p) => Post.fromJson(p)).toList();
  }
}