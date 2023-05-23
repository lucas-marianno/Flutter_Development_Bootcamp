import 'package:flutter/material.dart';
import 'package:flutter_navigation_demo/screen0.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go Back To Screen 1'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen0()));
                },
                child: const Text('Go to Screen 0'))
          ],
        ),
      ),
    );
  }
}
