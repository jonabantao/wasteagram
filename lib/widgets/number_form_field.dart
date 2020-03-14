import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends StatelessWidget {
  final String Function(String) validator;
  final void Function(String) onSaved;

  const NumberFormField({Key key, this.validator, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      textField: true,
      enabled: true,
      label: 'Number of wasted items',
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'NUMBER OF ITEMS',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 8.0),
            SizedBox(
              width: 200.0,
              child: TextFormField(
                keyboardType: TextInputType.number,
                // https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
                validator: validator,
                onSaved: onSaved,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
