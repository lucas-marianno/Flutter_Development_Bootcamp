import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restart_app/restart_app.dart';

locationErrorDialog(context, String exception) async {
  //late final ({num lat, num lon}) newLocation;

  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(exception),
      content: RichText(
        text: TextSpan(
          text: 'A location is necessary to provide the current weather!'
              ' Would you like to enter a Location manually?',
          style: TextStyle(color: Colors.grey[300]),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Restart.restartApp();
          },
          child: const Text('Try Again'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context, await manualLocationDialog(context));
          },
          child: const Text('Manual Location'),
        ),
      ],
    ),
  );
  //return newLocation;
}

manualLocationDialog(context) async {
  num lat = 0;
  num lon = 0;
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Enter manual Location'),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberOnlyTextField(
              label: 'Enter Latitude',
              onChanged: (value) {
                lat = num.parse(value);
              },
            ),
            NumberOnlyTextField(
              label: 'Enter Longitude',
              onChanged: (value) {
                lon = num.parse(value);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (lat != 0 || lon != 0) {
              Navigator.pop(context, (lat: lat, lon: lon));
            }
          },
          child: const Text('ok'),
        ),
      ],
    ),
  );
}

enum NumberSet { double, integer, real }

class NumberOnlyTextField extends StatelessWidget {
  const NumberOnlyTextField({required this.label, required this.onChanged, this.set, super.key});

  final String label;
  final void Function(String value) onChanged;
  final NumberSet? set;

  @override
  Widget build(BuildContext context) {
    const String double = r'\d|\.|-';
    const String integer = r'\d|-';
    const String real = r'\d';

    final Map<NumberSet, String> pattern = {
      NumberSet.double: double,
      NumberSet.integer: integer,
      NumberSet.real: real
    };

    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Enter latitude'),
      onChanged: (value) => onChanged(value),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(pattern[set] ?? double),
          replacementString: '',
        ),
      ],
    );
  }
}
