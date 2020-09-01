
import 'dart:async';

import 'package:fasted/widgets/timer/progress_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetTimer extends StatefulWidget {

  Color dayColor = Colors.amber;
  Color nightColor = Colors.blue[300];

  WidgetTimer({Key key}) : super(key: key);

  @override
  _WidgetTimerState createState() => _WidgetTimerState();
}

class _WidgetTimerState extends State<WidgetTimer> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  double _percentage;
  Timer _timer;

  TimeOfDay _currentTime;
  TimeOfDay _startFast;
  TimeOfDay _endFast;

  Tween<double> valueTween = Tween<double>(
    begin: 0,
    end: 1,
  );

  @override
  initState() {
    print("INIT_STATE");
    super.initState();
     _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer = new Timer.periodic( 
      const Duration(milliseconds: 10),
      (Timer timer) => {
        if (mounted) {
          setState(() {
            if (_percentage > 100) {
              timer.cancel();
              //_percentage = _currentTime.minute/60;
            } else {
                _currentTime = TimeOfDay.now();
                _percentage += 1;
                print("INC PERCENTAGE");
            }
          })
        }
      }
    );
  }

  getProgressText() {
    return Text( 
     TimeOfDay.now().hour.toString() + ":" + TimeOfDay.now().minute.toString(),
      style: TextStyle(
        fontSize: 40,
         fontWeight: FontWeight.w800, 
         color: Colors.black
      )
    );
  }

  double _timeToPercentage(int hours, int minutes) {
    const double hoursDay = 24.0;
    const double minutesHour = 60.0;
    return (hours + (minutes/minutesHour))/hoursDay;
  }

  progressView() {
    return 
    AnimatedBuilder(
      animation: _controller,
      child: Container(),
      builder: (context, child) {
        return CustomPaint( 
          child: Center(
            child: getProgressText(),
          ),
          foregroundPainter: ProgressPainter(
            colorDay: Colors.amber[300],
            colorNight: Colors.blue[300],
            colorGoal: Colors.red[300],
            colorOverlapDay: Colors.green[300],
            colorOverlapNight: Colors.green[700],
            colorFast: Colors.green,
            
            circleWidth: 64.0,
            percentage: this.valueTween.evaluate(_controller),
            
            startGoal: _timeToPercentage(12, 30),
            endGoal: _timeToPercentage(20,30),
            startNight: _timeToPercentage(22,0),
            endNight: _timeToPercentage(6,30),
            startFast: _timeToPercentage(9,0),
            endFast: _timeToPercentage(19,0),
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       alignment: Alignment.center,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(30.0),
              child: progressView()
            )
        ]
       )
    );
  }
}