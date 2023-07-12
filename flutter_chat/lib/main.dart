import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/chat_screen.dart';
import 'package:flutter_chat/screens/loading_screen.dart';
import 'package:flutter_chat/screens/login_screen.dart';
import 'package:flutter_chat/screens/registration_screen.dart';
import 'package:flutter_chat/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalizeFirebase();

  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        LoadingScreen.name: (context) => const LoadingScreen(),
        WelcomeScreen.name: (context) => const WelcomeScreen(),
        LoginScreen.name: (context) => const LoginScreen(),
        RegistrationScreen.name: (context) => const RegistrationScreen(),
        ChatScreen.name: (context) => const ChatScreen(),
      },
      initialRoute: LoadingScreen.name,
    );
  }
}

initalizeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
