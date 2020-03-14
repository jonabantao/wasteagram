import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:wasteagram/util/geopoint_util.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class WasteNewEntryScreen extends StatefulWidget {
  static const route = 'waste-new';

  @override
  _WasteNewEntryScreenState createState() => _WasteNewEntryScreenState();
}

class _WasteNewEntryScreenState extends State<WasteNewEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final WasteNewEntryScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    String _validateNumberField(value) {
      if (value.isEmpty) {
        return 'Please enter a number.';
      } else if (int.parse(value) < 1) {
        return 'Number can\'t be zero or negative';
      }

      return null;
    }

    _uploadImage(File image) async {
      StorageReference ref =
          FirebaseStorage.instance.ref().child(basename(image.path) + DateTime.now().toString());
      StorageUploadTask uploadTask = ref.putFile(image);

      await uploadTask.onComplete;

      return ref.getDownloadURL();
    }

    return Scaffold(
      appBar: WasteagramAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image.file(
                    args.image,
                    width: MediaQuery.of(context).size.height * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    // https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    validator: _validateNumberField,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) return;

                      final url = await _uploadImage(args.image);
                      final location = await getCurrentLocation();

                      Firestore.instance.collection('posts').add({
                        'imageUrl': url,
                        'date': DateTime.now(),
                        'geolocation': location,
                        'quantity': 3,
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Upload'),
                  ),
                ],
              ),
            ),
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
