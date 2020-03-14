import 'package:flutter/material.dart';

class PostScrollView extends StatelessWidget {
  final Widget child;

  const PostScrollView({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
