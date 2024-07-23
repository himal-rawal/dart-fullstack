import 'package:blogui/models/blog_post_model.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({super.key, required this.blogData});
  final Data blogData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Image.network(
            blogData.image ?? "",
            errorBuilder: (context, error, stackTrace) {
              return const Text("No Image Available");
            },
          ),
          Flexible(
            child: Text(
              blogData.title ?? "",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Flexible(
            child: Text(
              "blogData.title hfjhadjfgehfge ewfvgwvefgwfv wfg wegfwgefu wef wefuwefewe efuwefuwgfv efwue vdvgvvwegud ueuvdguweugfud uw bchbihuwi whegewevec ckhsgdcgvwsc khwggeb",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
