import 'package:flutter/material.dart';

class OnboardingGoal extends StatefulWidget {
  OnboardingGoal({Key key}) : super(key: key);

  @override
  _OnboardingGoalState createState() => _OnboardingGoalState();
}

class _OnboardingGoalState extends State<OnboardingGoal> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("GOALS"),
    );
  }
}