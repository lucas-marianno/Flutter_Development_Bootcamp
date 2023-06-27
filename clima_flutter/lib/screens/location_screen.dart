import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

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
                      //
                      manualLocation(context, updateUi);
                    },
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

manualLocation(context, Function updateUi) async {
  double lon = 0;
  double lat = 0;
  await showDialog(
    context: context,
    //barrierDismissible: false,
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
                lat = double.parse(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter longitude'),
              onChanged: (value) {
                lon = double.parse(value);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('ok'),
        ),
      ],
    ),
  );
  WeatherModel weatherModelFromLocation = WeatherModel();
  await weatherModelFromLocation.setLocation(lat, lon);

  updateUi(weatherModelFromLocation);
}
