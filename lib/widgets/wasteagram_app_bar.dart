import 'package:flutter/material.dart';

class WasteagramAppBar extends StatelessWidget with PreferredSizeWidget {
  final title;

  WasteagramAppBar() : title = WasteagramAppBar.appTitle;

  WasteagramAppBar.withCount(int count)
      : assert(count != null),
        title = WasteagramAppBar.appTitle + ' - $count';

  static const appTitle = 'Wasteagram';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
