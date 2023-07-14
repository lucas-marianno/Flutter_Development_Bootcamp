import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat/api/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/chat_screen.dart';
import 'package:flutter_chat/screens/splash_screen.dart';
import 'package:flutter_chat/screens/login_screen.dart';
import 'package:flutter_chat/screens/registration_screen.dart';
import 'package:flutter_chat/screens/welcome_screen.dart';

late SharedPreferences sharedPreferences;
String? userEmail;
String? userPassword;
bool isUserSignedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPreferences();
  await initalizeFirebase();
  await loginToFirebase();
  await FirebaseApi().initNotifications();

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
      initialRoute: isUserSignedIn ? ChatScreen.name : LoadingScreen.name,
    );
  }
}

initalizeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

initializeSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
  userEmail = sharedPreferences.getString('userEmail');
  userPassword = sharedPreferences.getString('userPassword');
}

loginToFirebase() async {
  if (userEmail != null && userPassword != null) {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: userEmail!, password: userPassword!);

    isUserSignedIn = auth.currentUser != null;
  }
}
