import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/screens/waste_detail_view_screen.dart';
import 'package:wasteagram/widgets/analytics_provider.dart';
import 'package:wasteagram/widgets/list_tile_waste_count_circle.dart';
import 'package:wasteagram/widgets/post_list_tile_title.dart';

class PostListTile extends StatelessWidget {
  final Post post;

  const PostListTile({Key key, @required this.post})
      : assert(post != null),
        super(key: key);

  _navigateToDetailsView(context, post) {
    _logViewPost(context, post);

    Navigator.pushNamed(
      context,
      WasteDetailViewScreen.route,
      arguments: WasteDetailViewScreenArguments(post),
    );
  }

  _logViewPost(context, Post post) {
    AnalyticsProvider.of(context)
      .analytics
      .logEvent(name: 'post_view', parameters: post.toLog());
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: PostListTileTitle(date: post.date),
      trailing: ListTileWasteCountCircle(count: post.quantity),
      onTap: () {
        _navigateToDetailsView(context, post);
      },
    );
  }
}
