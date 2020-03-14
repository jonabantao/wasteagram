import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  final void Function() onPressed;

  UploadButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      onTapHint: 'Upload a post',
      child: ButtonTheme(
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
          onPressed: onPressed,
        ),
      ),
    );
  }
}
