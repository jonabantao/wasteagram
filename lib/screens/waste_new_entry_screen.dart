import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Image.file(args.image),
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

                    StorageReference ref = FirebaseStorage.instance.ref().child(basename(args.image.path));
                    StorageUploadTask uploadTask = ref.putFile(args.image);

                    await uploadTask.onComplete;

                    final url = await ref.getDownloadURL();

                    print(url);
                  },
                  child: Text('Upload'),
                ),
              ],
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
