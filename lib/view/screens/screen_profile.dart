import 'package:fasted/view/screens/screen.dart';
import 'package:fasted/view/screens/screen_widget.dart';
import 'package:fasted/widgets/buttons/custom_button.dart';
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

  @override
  Widget build(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        CustomButton(
          text: 'Email',
          textColor: Colors.black,
          color: Colors.white,
          splashColor: Colors.black26,
          iconPath: 'email.png',
        ),
      
        CustomButton(
            text: 'Google',
            color: Colors.white,
            textColor: Colors.grey,
            splashColor: Colors.red[200],
            iconPath: 'logo_google.png',
        ),

        CustomButton(
          text: 'Apple',
          textColor: Colors.black,
          color: Colors.white,
          splashColor: Colors.black26,
          iconPath: 'logo_apple.png',
        ),
      ],
    );
  }
}