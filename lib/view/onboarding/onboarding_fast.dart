
import 'package:flutter/material.dart';

class OnboardingFast extends StatefulWidget {
  OnboardingFast({Key key}) : super(key: key);

  @override
  _OnboardingFastState createState() => _OnboardingFastState();
}

class _OnboardingFastState extends State<OnboardingFast> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
          Text(
            "Recommended Cycle.",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 24.0,

            )
          )
       ],
      )
    );
  }
}