import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/waste_new_entry_screen.dart';

class FloatingCameraButton extends StatelessWidget {
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
    return Semantics(
      child: FloatingActionButton(
        onPressed: () {
          _getImage(context);
        },
        tooltip: 'Take Picture',
        child: Icon(Icons.add),
      ),
      button: true,
      enabled: true,
      onTapHint: 'Select an image',
    );
  }
}
