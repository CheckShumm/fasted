import 'package:flutter/material.dart';

class FastingSlider extends StatefulWidget {

  List<Duration> times = new List<Duration>();

  FastingSlideR() {
    const increments = 4;
    Duration duration = Duration(hours: 0);
    for (int i = 0; i < increments*24 + 2; i++) {
      times.add(duration);
      duration += Duration(minutes: (60/increments).floor());
    }
  }

  @override
  _FastingSliderState createState() => _FastingSliderState();
}

class _FastingSliderState extends State<FastingSlider> {

  RangeValues _currentRangeValues = RangeValues(40, 70);

  @override
  void initState() {
    super.initState();
    const increments = 4;

  }


  String timetoString(int minutes) {
    int hours = (minutes/60).floor();
    minutes -= (hours*60);
    bool morning = hours%12 == 0 || hours <= 12;
    String hourString = (hours%12 == 0 ? 12 : hours%12).toString() + "h";
    return (hourString + " " + minutes.toString() + " " +  (morning? "am" : "pm")); 
  }


  @override
  Widget build(BuildContext context) {
    
    Duration start = this.widget.times[_currentRangeValues.start.floor()];
    Duration end = this.widget.times[_currentRangeValues.end.floor()];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RangeSlider(
        activeColor: Colors.black,
        inactiveColor: Colors.black,
        values: _currentRangeValues,
        min: 0,
        max: 96,
        divisions: 960,
        labels: RangeLabels(
          timetoString(start.inMinutes),
          timetoString(end.inMinutes)
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}