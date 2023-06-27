import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//TODO: learn how to hide this API key
const String apikey = 'b8f6d3242a3e54f9daa6e29546532bc9';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.latitude;
    double lon = location.longitude;

    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');

    var weatherData = await network.getdata();

    exitLoadingScreen(weatherData);
  }

  void exitLoadingScreen(weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
      )),
    );
  }
}
