import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() {
    location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print(location.latitude);
            print(location.longitude);
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
