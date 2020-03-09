import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/waste_new_entry_screen.dart';

class WasteListViewScreen extends StatelessWidget {
  static const route = '/';

  void _getImage(context) async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    Navigator.pushNamed(
      context,
      WasteNewEntryScreen.route,
      arguments: WasteNewEntryScreenArguments(image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: Center(
                  child: Text('TestTile'),
                ),
                trailing: Text('Hey'),
              ),
            ],
          ).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImage(context);
        },
        tooltip: 'Take Picture',
        child: Icon(Icons.add),
      ),
    );
  }
}
