import 'package:flutter/material.dart';

class WasteagramAppBar extends StatelessWidget with PreferredSizeWidget {
  final count;

  WasteagramAppBar({this.count});

  static const title = 'Wasteagram';

  @override
  Widget build(BuildContext context) {
    final titleCount = (count == null) ? '' : ' - $count';

    return AppBar(
      title: Text(WasteagramAppBar.title + titleCount),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
