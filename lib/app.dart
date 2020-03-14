import 'package:flutter/material.dart';
import 'package:wasteagram/screens/waste_detail_view_screen.dart';
import 'package:wasteagram/screens/waste_list_view_screen.dart';
import 'package:wasteagram/screens/waste_new_entry_screen.dart';

class MyApp extends StatelessWidget {
  static final routes = {
    WasteListViewScreen.route: (context) => WasteListViewScreen(),
    WasteNewEntryScreen.route: (context) => WasteNewEntryScreen(),
    WasteDetailViewScreen.route: (context) => WasteDetailViewScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WasteListViewScreen.route,
      routes: routes,
    );
  }
}
