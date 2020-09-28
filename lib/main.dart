
import 'package:fasted/backend/auth.dart';
import 'package:fasted/views/onboarding_container.dart';
import 'package:fasted/views/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fasted/views/screens_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(home: OnBoardingContainer()));
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
          print("ERR [Firebase connection unsuccessful]: " + snapshot.error.toString());
          return MaterialApp(
            title: 'fasted',
            home: home,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("Firebase connection successful.");
          Auth.initAuthListener();
          return MaterialApp(
            title: 'fasted',
            home: home,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashLogo();
      },
    );
  }
}
