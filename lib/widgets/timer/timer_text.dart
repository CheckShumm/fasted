
import 'dart:async';

import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
  final Duration Function(DateTime) computeFastDuration;

  TimerText({Key key, @required this.computeFastDuration}): super(key: key);

  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {

  // States
  DateTime _currentTime;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => {
        if (mounted)
          setState(() { _currentTime = DateTime.now(); })
    });
  }
  
  @override
  Widget build(BuildContext context) {
    //new Timer.periodic(Duration(seconds: 5), (Timer t) => setState((){}));
    Duration duration = this.widget.computeFastDuration(_currentTime);
    return Text( 
      duration.inHours.toString() + "h " + (duration.inMinutes%24).toString() + "m",
      style: TextStyle(
        fontSize: 32,
         fontWeight: FontWeight.w400, 
         color: Colors.black
      )
    );
  }
}