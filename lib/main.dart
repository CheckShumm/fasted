import 'dart:math';

import 'package:fasted/views/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// views
import 'package:fasted/views/onboarding_container.dart';
import 'package:fasted/views/screens_container.dart';

void main() {

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
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(home: ScreensContainer()));
}

class App extends StatelessWidget {

  // initialize firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final Widget home;

  // constructor
  App({ Key key, @required this.home }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        
        // Check for errors
        if (snapshot.hasError) {
          print("ERR: Firebase unable to connect.");
          return MaterialApp(
            title: 'fasted',
            home: home,
            // routes: <String, WidgetBuilder> {
            //   '/fasted/goals': (BuildContext context) => MyPage(title: 'page A'),
            // },
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'fasted',
            home: home,
            // routes: <String, WidgetBuilder> {
            //   '/fasted/goals': (BuildContext context) => MyPage(title: 'page A'),
            // },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashLogo();
      },
    );
  }
}
