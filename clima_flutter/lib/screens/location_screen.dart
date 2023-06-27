import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(this.weatherData, {super.key});
  final weatherData;

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
    updateUi(widget.weatherData);
    getWeatherModel();
  }

  void updateUi(weatherData) {
    temp = (weatherData['main']['temp']).toInt();
    id = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
  }

  void getWeatherModel() {
    WeatherModel model = WeatherModel();
    weatherIcon = model.getWeatherIcon(id);
    message = model.getMessage(temp);
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.near_me,
                    ),
                    iconSize: 50.0,
                  ),
                  IconButton(
                    onPressed: () {},
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
                  '$message in $cityName',
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
