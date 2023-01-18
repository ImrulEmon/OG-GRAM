import 'package:flutter/material.dart';
import 'package:og_gram/state/posts/models/post.dart';
import 'package:og_gram/views/components/post/post_thumbnail_view.dart';
import 'package:og_gram/views/post_comments/post_comments_view.dart';

class PostsGridView extends StatelessWidget {
  final Iterable<Post> posts;

  const PostsGridView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            // Navigate to post Details view

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PostDetailsView(
            //       post: post,
            //     ),
            //   ),
            // );
          },
        );
      },
    );
  }
}
