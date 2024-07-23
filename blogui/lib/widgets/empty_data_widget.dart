import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Post Available.Create new Blog Post"),
    );
  }
}
