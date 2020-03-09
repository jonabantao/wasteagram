import 'dart:io';
import 'package:flutter/material.dart';

class WasteNewEntryScreen extends StatefulWidget {
  static const route = 'waste-new';

  @override
  _WasteNewEntryScreenState createState() => _WasteNewEntryScreenState();
}

class _WasteNewEntryScreenState extends State<WasteNewEntryScreen> {
  @override
  Widget build(BuildContext context) {
    final WasteNewEntryScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: Image.file(args.image),
    );
  }
}

class WasteNewEntryScreenArguments {
  final File image;

  WasteNewEntryScreenArguments(this.image) : assert(image != null);
}
