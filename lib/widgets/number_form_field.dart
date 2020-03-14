import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends StatelessWidget {
  final String Function(String) validator;
  final void Function(String) onSaved;

  const NumberFormField({Key key, this.validator, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      // https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      validator: validator,
      onSaved: onSaved,
    );
  }
}
