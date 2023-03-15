import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'palette.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyPalette.primaryColor(),
        body: SafeArea(
          // creates a margin from areas like status bar, navigation bar, etc
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  foregroundImage: AssetImage("lib/assets/avatar.png"),
                ),
                Text(
                  'Lucas Moraes',
                  style: GoogleFonts.lobster(
                    fontSize: 80,
                    color: MyPalette.textIconsColor(),
                    shadows: [
                      Shadow(
                        color: MyPalette.darkPrimaryColor(),
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
                Divider(),
                Text(
                  'flutter developer'.toUpperCase(),
                  style: GoogleFonts.fjallaOne(
                    fontSize: 25,
                    color: MyPalette.textIconsColor(),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                    //fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: MyPalette.darkPrimaryColor(),
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
                Divider(),
                ElevatedButton(
                  onPressed: () => UrlLauncher.launchUrl(
                      Uri(scheme: 'tel', path: '+55(11)99999-9999'),
                      ),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: MyPalette.primaryTextColor(),
                    ),
                    title: Text('+55 (11) 99999-9999',
                        style: TextStyle(
                            color: MyPalette.primaryTextColor(), fontSize: 20),
                            ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => UrlLauncher.launchUrl(
                      Uri.parse('https://github.com/vulture-coding'),
                      mode: LaunchMode.externalApplication),
                  child: ListTile(
                    leading: Icon(
                      Icons.open_in_new,
                      color: MyPalette.primaryTextColor(),
                    ),
                    title: Text(
                      'GitHub/vulture-coding',
                      style: TextStyle(
                        color: MyPalette.primaryTextColor(),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => UrlLauncher.launchUrl(
                      Uri(scheme: 'mailto', path: 'lucas.pk16@outlook.com'),
                      mode: LaunchMode.externalApplication),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: MyPalette.primaryTextColor(),
                    ),
                    title: Text(
                      'lucas.pk16@outlook.com',
                      style: TextStyle(
                        color: MyPalette.primaryTextColor(),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
