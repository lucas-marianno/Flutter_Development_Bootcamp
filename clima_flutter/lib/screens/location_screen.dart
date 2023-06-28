import 'package:clima_flutter/screens/city_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:restart_app/restart_app.dart';
import '../services/dialog_alerts.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(this.weatherModel, {super.key});
  final WeatherModel weatherModel;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late int id;
  late String cityName;
  late String weatherIcon;
  late String message;

  @override
  void initState() {
    super.initState();

    updateUi(widget.weatherModel);
  }

  void updateUi(WeatherModel weatherModel) {
    setState(() {
      temp = (weatherModel.weatherData['main']['temp']).toInt();
      id = weatherModel.weatherData['weather'][0]['id'];
      cityName = weatherModel.weatherData['name'];
      weatherIcon = weatherModel.getWeatherIcon(id);
      message = weatherModel.getMessage(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      final l = await manualLocationDialog(context);
                      WeatherModel newModel = WeatherModel();
                      await newModel.setLocation(l.lat, l.lon);
                      updateUi(newModel);
                    },
                    icon: const Icon(
                      Icons.near_me,
                    ),
                    iconSize: 50.0,
                  ),
                  IconButton(
                    onPressed: () {
                      Restart.restartApp();
                    },
                    icon: const Icon(Icons.restart_alt),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const CityScreen()),
                        ),
                      );
                      print(typedCityName);
                    },
                    icon: const Icon(
                      Icons.location_city,
                    ),
                    iconSize: 50.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
