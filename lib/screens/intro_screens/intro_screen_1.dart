import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Intro_Screen_1 extends StatelessWidget {
  const Intro_Screen_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 255, 252, 252).withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset:const Offset(0, 3), // changes position of shadow
      ),
    ],
      ),
      
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
                  SvgPicture.asset('assets/first_SVG.svg',height: 250,width: 250,),
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text("Add Notes",style: TextStyle(fontFamily: 'Nerko One',fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),),
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