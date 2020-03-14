import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/util/collection.dart';
import 'package:wasteagram/util/geopoint_util.dart';
import 'package:wasteagram/widgets/number_form_field.dart';
import 'package:wasteagram/widgets/post_scroll_view.dart';
import 'package:wasteagram/widgets/wasteagram_app_bar.dart';

class WasteNewEntryScreen extends StatefulWidget {
  static const route = 'waste-new';

  @override
  _WasteNewEntryScreenState createState() => _WasteNewEntryScreenState();
}

class _WasteNewEntryScreenState extends State<WasteNewEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _post = Post();

  File _getImage(BuildContext context) {
    final WasteNewEntryScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return args.image;
  }

  String _validateNumberField(value) {
    if (value.isEmpty) {
      return 'Please enter a number.';
    } else if (int.parse(value) < 1) {
      return 'Number can\'t be zero or negative';
    }

    return null;
  }

  _saveNumberField(value) {
    _post.quantity = int.parse(value);
  }

  _uploadImage(File image) async {
    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child(DateTime.now().toString() + basename(image.path));
    StorageUploadTask uploadTask = ref.putFile(image);

    await uploadTask.onComplete;

    return ref.getDownloadURL();
  }

  _savePost(BuildContext context, File image) async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    _post.date = DateTime.now();
    _post.geolocation = await getCurrentLocation();
    _post.imageURL = await _uploadImage(image);

    Firestore.instance.collection(Collection.posts).add(_post.toMap());

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    File image = _getImage(context);

    return Scaffold(
      appBar: WasteagramAppBar(),
      body: PostScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.file(
                image,
                width: MediaQuery.of(context).size.height * 0.4,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24.0),
              NumberFormField(
                validator: _validateNumberField,
                onSaved: _saveNumberField,
              ),
              const SizedBox(height: 48.0),
              ButtonTheme(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: MediaQuery.of(context).size.width / 3,
                ),
                child: RaisedButton(
                  child: Icon(
                    Icons.cloud_upload,
                    size: 32.0,
                    color: Theme.of(context).buttonColor,
                  ),
                  onPressed: () async {
                    await _savePost(context, image);
                  },
                ),
              )
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
