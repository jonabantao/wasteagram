import 'package:flutter/material.dart';

class ListTileWasteCountCircle extends StatelessWidget {
  final count;

  const ListTileWasteCountCircle({Key key, @required this.count})
      : assert(count != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$count wasted items for this post',
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxHeight * 0.75,
            height: constraints.maxHeight * 0.75,
            child: Center(
              child: Text(
                '$count',
                style: Theme.of(context).accentTextTheme.title,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
