import 'dart:math';

import 'package:fasted/view/onboarding_container.dart';
import 'package:fasted/view/screens_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  // initial containers
  // ScreensContainer _screensContainer = new ScreensContainer();
  // OnBoardingContainer _onBoardingContainer = new OnBoardingContainer();
  // Widget _home = _screensContainer; 

  // // Check shared preferences for initialized user
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool initialized = prefs.getBool('initialized');

  // // set correct start screen
  // if (initialized) {
  //   _home = _screensContainer;
  // } else {
  //   prefs.setBool('first_time', false);
  //   _home = _onBoardingContainer;
  // }

  runApp(MyApp(home: ScreensContainer()));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({ Key key, @required this.home }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return MaterialApp(
      title: 'fasted',
      home: home,
      // routes: <String, WidgetBuilder>{
      //   // Set routes for using the Navigator.
      //   '/home': (BuildContext context) => new ScreensContainer(),
      //   '/OnBoarding': (BuildContext context) => new OnBoardingContainer()
      // },
    );
  }
}
