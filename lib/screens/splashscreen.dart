import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/homescreen.dart';
import 'package:notes_app/screens/introduction.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), checkLoginStatus);
  }

Future<void> checkLoginStatus()async{
    final prefs = await SharedPreferences.getInstance();
    bool isSignup = prefs.getBool("passed") ?? false;
    if(isSignup == false){
      moveNext();
    }
    else if (isSignup == true){
      moveNextt();
    }
    
    
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(
                  height: 300,
                  width: 300,
                  child: RiveAnimation.asset('assets/new_file.riv')),
              Padding(
                padding:  EdgeInsets.only(top: 50),
                child: Text(
                  'Memo Minder',
                  style: TextStyle(fontFamily: 'Nerko One',color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void moveNext(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const IntroductionScreen()));
  }
  void moveNextt(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomeScreen()));
  }
}
