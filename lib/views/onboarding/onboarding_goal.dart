import 'package:flutter/material.dart';

class OnboardingGoal extends StatefulWidget {
  OnboardingGoal({Key key}) : super(key: key);

  @override
  _OnboardingGoalState createState() => _OnboardingGoalState();
}

class _OnboardingGoalState extends State<OnboardingGoal> {

  // *** States *** \\
  TimeOfDay _timeStartFast;

  @override
  void initState() {
    super.initState();
    _timeStartFast = new TimeOfDay(hour: 18, minute: 30);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Text(
        "What time would you like to begin fasting?",
        ),
        GestureDetector(
            onTap:() async {
              TimeOfDay startTime = await showTimePicker(
                context: context, 
                initialTime: TimeOfDay(hour:18, minute:30));
              setState(() { _timeStartFast = startTime; });
            },
            child: Text(
            TimeOfDay.now().toString()
          ),
        )
      ]
    );
  }
}