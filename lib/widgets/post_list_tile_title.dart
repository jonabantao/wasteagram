import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostListTileTitle extends StatelessWidget {
  final DateTime date;

  PostListTileTitle({@required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        DateFormat('EEEE, MMM. d').format(date),
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
