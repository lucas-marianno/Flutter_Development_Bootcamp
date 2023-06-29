import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restart_app/restart_app.dart';
import 'country_flag.dart';
import '../services/geocode.dart';

enum NumberSet { double, integer, real }

const String double = r'\d|\.|-';
const String integer = r'\d|-';
const String real = r'\d';

const Map<NumberSet, String> pattern = {
  NumberSet.double: double,
  NumberSet.integer: integer,
  NumberSet.real: real
};

locationErrorDialog(context, String exception) async {
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
}

manualLocationDialog(context) async {
  num lat = 0;
  num lon = 0;
  return await showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Enter manual Location'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NumberOnlyTextField(
            label: 'Enter Latitude',
            onChanged: (value) {
              if (value != '-') {
                lat = num.parse(value);
              }
            },
          ),
          NumberOnlyTextField(
            label: 'Enter Longitude',
            onChanged: (value) {
              if (value != '-') {
                lon = num.parse(value);
              }
            },
          ),
        ],
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

multipleCityDialog(context, List<City> cityList) async {
  List<Widget> listOfCountries(context, List<City> cityList) {
    List<Widget> list = [];
    for (City city in cityList) {
      String name = city.name;
      String flag = countryFlag(city.country);
      String state = city.state;

      list.add(ListTile(
        leading: Text(flag),
        title: Text('$name / $state'),
        trailing: Text(city.country),
        titleTextStyle: const TextStyle(fontSize: 20),
        leadingAndTrailingTextStyle: const TextStyle(fontSize: 20),
        onTap: () {
          Navigator.pop(context, (lat: city.lat, lon: city.lon));
        },
      ));
    }
    return list;
  }

  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: listOfCountries(context, cityList),
      ),
    ),
  );
}

class NumberOnlyTextField extends StatelessWidget {
  const NumberOnlyTextField({required this.label, required this.onChanged, this.set, super.key});

  final String label;
  final void Function(String value) onChanged;
  final NumberSet? set;

  @override
  Widget build(BuildContext context) {
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
