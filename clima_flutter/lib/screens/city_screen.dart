import 'package:clima_flutter/utilities/dialog_alerts.dart';
import 'package:clima_flutter/services/geocode.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  List<City> cityList = [];

  exit() async {
    if (cityName != '') {
      Geocoding geocode = Geocoding();
      await geocode.fetchData(cityName);

      if (geocode.hasData) {
        // ignore: use_build_context_synchronously
        var coord = await multipleCityDialog(context, geocode.cityList);
        // ignore: use_build_context_synchronously
        Navigator.pop(context, coord);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: kInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                  onSubmitted: (value) {
                    exit();
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  exit();
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
