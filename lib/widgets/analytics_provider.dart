import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class AnalyticsProvider extends InheritedWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  final Widget child;

  const AnalyticsProvider({
    @required this.analytics,
    @required this.observer,
    @required this.child,
  })  : assert(analytics != null),
        assert(observer != null),
        assert(child != null);

  static AnalyticsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnalyticsProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
