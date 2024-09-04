import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/screens/splashscreen.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Transparent status bar
    statusBarBrightness: Brightness.dark, // Dark text for status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
