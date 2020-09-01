
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter{

  Color colorDay;
  Color colorNight;
  Color colorGoal;
  Color colorOverlapDay;
  Color colorOverlapNight;
  Color colorFast;

  double circleWidth; 
  double percentage;

  double startGoal;
  double endGoal;
  double startNight;
  double endNight;
  double startFast;
  double endFast;

  ProgressPainter({
    this.colorDay,
    this.colorNight,
    this.colorGoal,
    this.colorOverlapDay,
    this.colorOverlapNight,
    this.colorFast,

    this.circleWidth,
    this.percentage,

    this.startGoal,
    this.endGoal,
    this.startNight,
    this.endNight,
    this.startFast,
    this.endFast,
  });

  getPaint(Color color) {
    return Paint()
    ..color = color
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = circleWidth;

  }

  double _toRadians(double percentage) {
    return (percentage*2*pi);
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paintDay = getPaint(colorDay);
    Paint paintNight = getPaint(colorNight);
    Paint paintGoal = getPaint(colorGoal);
    Paint paintOverlapDay = getPaint(colorOverlapDay);
    Paint paintOverlapNight = getPaint(colorOverlapNight);
    Paint paintFast = getPaint(colorFast);

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2);


    // night time circle
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                                  0, 2*pi*percentage, false, paintNight);

    // day time arc
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                                  _toRadians(endNight)-pi/2, _toRadians(endGoal-endNight)*percentage,
                                   false, paintDay);

    // goal arc
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                              _toRadians(startGoal)-pi/2, _toRadians(endGoal-startGoal)*percentage,
                               false, paintGoal);

    //night time overlap arc
    if (endFast > endGoal) {
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                                    _toRadians(endFast)-pi/2, _toRadians(endGoal-endFast)*percentage,
                                     false, paintOverlapNight);
      // fast arc
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                                _toRadians(startFast)-pi/2, _toRadians(endGoal-startFast)*percentage,
                                 false, paintFast);  
    } else {
      // fast arc
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                                _toRadians(startFast)-pi/2, _toRadians(endFast-startFast)*percentage,
                                 false, paintFast);
    }

    //day time overlap arc
    if (startFast < startGoal) 
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius ), 
                                    _toRadians(startGoal)-pi/2, _toRadians(startFast-startGoal), false, paintOverlapDay);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
  }

}