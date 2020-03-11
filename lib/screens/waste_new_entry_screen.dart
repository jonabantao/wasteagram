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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.file(args.image),
              TextFormField(
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                onPressed: null,
                child: Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WasteNewEntryScreenArguments {
  final File image;

  WasteNewEntryScreenArguments(this.image) : assert(image != null);
}
