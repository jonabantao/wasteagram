import 'package:flutter/material.dart';
import 'package:wasteagram/util/date_util.dart';

class PostListTileTitle extends StatelessWidget {
  final DateTime date;

  const PostListTileTitle({Key key, @required this.date})
      : assert(date != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        printListTileDate(date),
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
