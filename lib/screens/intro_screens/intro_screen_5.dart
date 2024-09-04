import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro_Screen_5 extends StatefulWidget {
  const Intro_Screen_5({super.key});

  @override
  State<Intro_Screen_5> createState() => _Intro_Screen_5State();
}

class _Intro_Screen_5State extends State<Intro_Screen_5> {
  late final SharedPreferences prefs;
  
  Future<void> setValueBool() async{
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool('passed', true);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 550,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius:const BorderRadius.all(Radius.circular(50))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  SvgPicture.asset('assets/fifth_SVG.svg',height: 250,width: 250,),
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text("Excited ? ",style: TextStyle(fontFamily: 'Nerko One',fontWeight: FontWeight.bold,fontSize: 50,color: Colors.black),),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}