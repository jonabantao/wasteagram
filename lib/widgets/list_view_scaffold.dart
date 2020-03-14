import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/widgets/floating_camera_button.dart';
import 'package:wasteagram/widgets/post_list_tile.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class ListViewScaffold extends StatelessWidget {
  final posts;

  ListViewScaffold({@required this.posts}) : assert(posts != null);

  int _sumWasteQuantity() {
    return posts.map((post) => post['quantity']).fold(0, (a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    final int count = _sumWasteQuantity();

    return Scaffold(
      appBar: WasteagramAppBar(count: count),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostListTile(post: Post.fromFirestore(posts[index]));
        },
        separatorBuilder: (context, index) => Divider(thickness: 2),
        itemCount: posts.length,
      ),
      floatingActionButton: FloatingCameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
