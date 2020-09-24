
import 'package:fasted/auth/auth_controller.dart';
import 'package:fasted/views/screens/profile/auth_email.dart';
import 'package:fasted/views/screens/profile/unauthorized.dart';
import 'package:fasted/views/screens/screen.dart';
import 'package:fasted/views/screens/screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ScreenProfile extends StatefulWidget implements ScreenWidget {

  final Screen screen;
  ScreenProfile({Key key, @required this.screen}) : super(key: key);

  @override
  _ScreenProfileState createState() => _ScreenProfileState();

  @override
  Screen getScreen() { return screen; }

  @override
  Widget getWidget() { return this; }

}

class _ScreenProfileState extends State<ScreenProfile> {

  // states
  bool unathorized = true;
  bool signUpFormEmail = false;

  @override
  Widget build(BuildContext context) {
    return 
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: (!signUpFormEmail) ?
          Unauthorized(
            onEmailPressed: () => setState(() { signUpFormEmail = true; }),
              
            visible: !signUpFormEmail
          ) :
          AuthEmail(
            visible: signUpFormEmail,
            onBack: () => {setState(() { signUpFormEmail = false; }) },
            onSignUp: (String email, String password) async {
              setState(() { 
                signUpFormEmail = false; 
                //TODO authorized = true;
              });
            },
          )
      );
  }
}