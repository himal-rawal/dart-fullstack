import 'dart:convert';

import 'package:blogui/models/blog_post_model.dart';
import 'package:http/http.dart' as http;

class BlogServices {
  BlogServices._();
  static Future<BlogPostModel> fetchPosts() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/getposts'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return BlogPostModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load your post');
    }
  }
}
