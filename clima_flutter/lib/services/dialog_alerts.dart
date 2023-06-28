import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

Future<({num lat, num lon})> locationErrorDialog(context, String exception) async {
  late final ({num lat, num lon}) newLocation;

  await showDialog(
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
            newLocation = await manualLocationDialog(context);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: const Text('Manual Location'),
        ),
      ],
    ),
  );
  return newLocation;
}

Future<({num lat, num lon})> manualLocationDialog(context) async {
  String lat = '0';
  String lon = '0';
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Enter manual Location'),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter latitude'),
              onChanged: (value) {
                lat = value;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter longitude'),
              onChanged: (value) {
                lon = value;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (lat != '0' || lon != '0') {
              Navigator.pop(context);
            }
          },
          child: const Text('ok'),
        ),
      ],
    ),
  );

  return (lat: num.parse(lat), lon: num.parse(lon));
}
