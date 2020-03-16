import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/widgets/floating_camera_button.dart';
import 'package:wasteagram/widgets/post_list_tile.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class ListViewScaffold extends StatelessWidget {
  final List<DocumentSnapshot> posts;

  const ListViewScaffold({Key key, @required this.posts})
      : assert(posts != null),
        super(key: key);

  int _sumWasteQuantity() {
    return posts.map((post) => post['quantity']).fold(0, (a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    final int count = _sumWasteQuantity();

    return Scaffold(
      appBar: WasteagramAppBar.withCount(count),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostListTile(
            key: Key(posts[index].documentID),
            post: Post.fromFirestore(posts[index]),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 1.5),
        itemCount: posts.length,
      ),
      floatingActionButton: const FloatingCameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
