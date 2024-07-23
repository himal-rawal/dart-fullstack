import 'package:blogui/models/blog_post_model.dart';
import 'package:blogui/services/blog_services.dart';
import 'package:blogui/widgets/blog_post_home_body.dart';
import 'package:flutter/material.dart';

class BlogPostHomePage extends StatefulWidget {
  const BlogPostHomePage({super.key});

  @override
  State<BlogPostHomePage> createState() => _BlogPostHomePageState();
}

class _BlogPostHomePageState extends State<BlogPostHomePage> {
  late Future<BlogPostModel> getPosts;
  @override
  void initState() {
    getPosts = BlogServices.fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Himal's Blog"),
        ),
        body: FutureBuilder<BlogPostModel>(
            future: getPosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final blogList = snapshot.data?.data ?? [];
                return BlogPostHomeBody(blogList: blogList);
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
