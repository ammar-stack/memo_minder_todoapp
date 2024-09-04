import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Intro_Screen_2 extends StatelessWidget {
  const Intro_Screen_2({super.key});

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
                  SvgPicture.asset('assets/second_SVG.svg',height: 250,width: 250,),
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text("Delete Notes",style: TextStyle(fontFamily: 'Nerko One',fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),),
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