import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/screens/waste_detail_view_screen.dart';
import 'package:wasteagram/screens/waste_list_view_screen.dart';
import 'package:wasteagram/screens/waste_new_entry_screen.dart';
import 'package:wasteagram/widgets/analytics_provider.dart';

class MyApp extends StatelessWidget {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();
  static final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static final routes = {
    WasteListViewScreen.route: (context) => WasteListViewScreen(),
    WasteNewEntryScreen.route: (context) => WasteNewEntryScreen(),
    WasteDetailViewScreen.route: (context) => WasteDetailViewScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return AnalyticsProvider(
      analytics: analytics,
      observer: observer,
      child: MaterialApp(
        title: 'Wasteagram',
        theme: ThemeData(primarySwatch: Colors.teal),
        navigatorObservers: <NavigatorObserver>[observer],
        initialRoute: WasteListViewScreen.route,
        routes: routes,
      ),
    );
  }
}
