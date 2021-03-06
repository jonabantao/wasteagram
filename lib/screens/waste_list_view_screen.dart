import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/util/collection.dart';
import 'package:wasteagram/widgets/list_view_scaffold.dart';
import 'package:wasteagram/widgets/loading_scaffold.dart';

class WasteListViewScreen extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection(Collection.posts)
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.documents.isNotEmpty) {
          return ListViewScaffold(posts: snapshot.data.documents);
        } else {
          return const LoadingScaffold();
        }
      },
    );
  }
}
