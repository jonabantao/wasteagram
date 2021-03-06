import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/util/collection.dart';
import 'package:wasteagram/util/geopoint_util.dart';
import 'package:wasteagram/widgets/analytics_provider.dart';
import 'package:wasteagram/widgets/number_form_field.dart';
import 'package:wasteagram/widgets/upload_button.dart';
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
    _logCreatePost(context, _post);

    Navigator.pop(context);
  }

  _logCreatePost(BuildContext context, Post post) {
    AnalyticsProvider.of(context)
      .analytics
      .logEvent(name: 'post_create', parameters: _post.toLog());
  }

  @override
  Widget build(BuildContext context) {
    File image = _getImage(context);

    return Scaffold(
      appBar: WasteagramAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Semantics(
                  image: true,
                  label: 'Pictures of wasted items',
                  child: Image.file(
                    image,
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24.0),
                NumberFormField(
                  validator: _validateNumberField,
                  onSaved: _saveNumberField,
                ),
                const Spacer(),
                UploadButton(
                  onPressed: () {
                    _savePost(context, image);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class WasteNewEntryScreenArguments {
  final File image;

  WasteNewEntryScreenArguments(this.image) : assert(image != null);
}
