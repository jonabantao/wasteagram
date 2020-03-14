import 'package:flutter/material.dart';

class ListTileWasteCountCircle extends StatelessWidget {
  final count;

  ListTileWasteCountCircle({@required this.count}) : assert(count != null);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
    );
  }
}
