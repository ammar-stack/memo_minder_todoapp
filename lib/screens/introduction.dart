import 'package:flutter/material.dart';
import 'package:notes_app/screens/homescreen.dart';
import 'package:notes_app/screens/intro_screens/intro_screen_1.dart';
import 'package:notes_app/screens/intro_screens/intro_screen_2.dart';
import 'package:notes_app/screens/intro_screens/intro_screen_3.dart';
import 'package:notes_app/screens/intro_screens/intro_screen_4.dart';
import 'package:notes_app/screens/intro_screens/intro_screen_5.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  //controller to control which page we are on
  final PageController _controller = PageController();
  //check if we are on the last page
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: ((index) {
            setState(() {
              onLastPage = (index == 4);
            });
          }),
          controller: _controller,
          children: const [
            Intro_Screen_1(),
            Intro_Screen_2(),
            Intro_Screen_3(),
            Intro_Screen_4(),
            Intro_Screen_5()
          ],
        ),
        //dot indicators
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          fontFamily: 'Nerko One',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 5),
                  onLastPage
                      ? GestureDetector(
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: 'Nerko One',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                        )
                      : GestureDetector(
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                fontFamily: 'Nerko One',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setValueBool();
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        )
                ],
              )),
        )
      ],
    ));
  }


  Future<void> setValueBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('passed', true);
  }
}
