import 'package:flutter/material.dart';
import '../widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String name = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              child: Hero(tag: 'logo', child: Image.asset('images/logo.png')),
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedTextField(
              hint: 'Enter your email',
              outlineColor: Colors.blueAccent,
              onChanged: (value) {
                //Do something with the user input.
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            RoundedTextField(
              hint: 'Enter your password.',
              outlineColor: Colors.blueAccent,
              onChanged: (value) {
                //Do something with the user input.
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              label: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                //Implement registration functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
