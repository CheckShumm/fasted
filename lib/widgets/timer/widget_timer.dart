
import 'dart:async';

import 'package:fasted/widgets/timer/progress_painter.dart';
import 'package:fasted/widgets/timer/timer_text.dart';
import 'package:flutter/material.dart';

class WidgetTimer extends StatefulWidget {

  Color dayColor = Colors.amber;
  Color nightColor = Colors.blue[300];

  Duration startFast;
  Duration endFast;

  double width;
  double height;

  final Duration Function(DateTime) computeFastDuration;

  WidgetTimer({Key key,
    @required this.startFast, @required this.endFast,
    @required this.width, @required this.height,
    @required this.computeFastDuration,
  }) : super(key: key);

  @override
  _WidgetTimerState createState() => _WidgetTimerState();
}

class _WidgetTimerState extends State<WidgetTimer> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  double _percentage;
  Timer _timer;

  TimeOfDay _currentTime;

  Tween<double> valueTween = Tween<double>(
    begin: 0,
    end: 1,
  );

  @override
  initState() {
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
            }
          })
        }
      }
    );
  }

  getProgressText() {
    return Text( 
     TimeOfDay.now().hour.toString() + "h " + TimeOfDay.now().minute.toString() + "m",
      style: TextStyle(
        fontSize: 32,
         fontWeight: FontWeight.w400, 
         color: Colors.black
      )
    );
  }

  double _timeToPercentage(int minutes) {
    return minutes/(60*24);
  }

  progressView() {
    return 
    AnimatedBuilder(
      animation: _controller,
      child: Container(),
      builder: (context, child) {
        return CustomPaint( 
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TimerText(
                  computeFastDuration: this.widget.computeFastDuration
                ),
                Text( 
                  // TODO implement streak counter
                  "streak. 6d",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300, 
                    color: Colors.black54
                  )
                )
              ]
            ),
          ),
          foregroundPainter: ProgressPainter(
            colorDay: Colors.amber[300],
            colorNight: Colors.blue[300],
            colorGoal: Colors.red[300],
            colorOverlapDay: Colors.green[300],
            colorOverlapNight: Colors.green[700],
            colorFast: Colors.green,
            
            circleWidth: 32.0,
            percentage: this.valueTween.evaluate(_controller),
            
            startGoal: _timeToPercentage(720),
            endGoal: _timeToPercentage(1200),
            startNight: _timeToPercentage(1500),
            endNight: _timeToPercentage(480),
            startFast: _timeToPercentage(this.widget.startFast.inMinutes),
            endFast: _timeToPercentage(this.widget.endFast.inMinutes),
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
              height: this.widget.height,
              width: this.widget.width,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(30.0),
              child: progressView()
            )
        ]
       )
    );
  }
}