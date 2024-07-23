import 'package:blogui/models/blog_post_model.dart';
import 'package:blogui/widgets/blog_tile.dart';
import 'package:blogui/widgets/empty_data_widget.dart';
import 'package:flutter/material.dart';

class BlogPostHomeBody extends StatelessWidget {
  const BlogPostHomeBody({super.key, required this.blogList});
  final List<Data> blogList;
  @override
  Widget build(BuildContext context) {
    return blogList.isEmpty
        ? const EmptyDataWidget()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: blogList.length,
            itemBuilder: (context, index) {
              return BlogTile(blogData: blogList[index]);
            },
          );
  }
}
