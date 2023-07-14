import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/api/firebase_api.dart';
import 'package:flutter_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets.dart';
import 'package:flutter_chat/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;

  String email = '';
  String password = '';
  bool inAsyncCall = false;

  void toggleInAsyncCall() => setState(() => inAsyncCall = inAsyncCall ? false : true);

  login() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      toggleInAsyncCall();
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);

        if (auth.currentUser != null) {
          sharedPreferences.setString('userEmail', email);
          sharedPreferences.setString('userPassword', password);
          await FirebaseApi().setFCMToken();
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, ChatScreen.name);
          toggleInAsyncCall();
        }
      } catch (e) {
        toggleInAsyncCall();
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Log in Failed!'),
            content: RichText(
              text: TextSpan(
                text: e.toString(),
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    height: 200.0,
                    child: Hero(tag: 'logo', child: Image.asset('images/logo.png')),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                RoundedTextField(
                  hint: 'Enter your email',
                  outlineColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedTextField(
                  hint: 'Enter your password.',
                  outlineColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    password = value;
                  },
                  onSubmitted: (_) => login(),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  label: 'Log in',
                  color: Colors.lightBlueAccent,
                  onPressed: () => login(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
