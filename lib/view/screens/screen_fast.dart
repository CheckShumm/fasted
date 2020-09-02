import 'package:fasted/view/screens/screen.dart';
import 'package:fasted/view/screens/screen_widget.dart';
import 'package:fasted/widgets/timer/widget_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenFast extends StatefulWidget implements ScreenWidget {

  final Screen screen;

  ScreenFast({Key key, @required this.screen}) : super(key: key);

  @override
  _ScreenFastState createState() => _ScreenFastState();

  @override
  Screen getScreen() { return screen; }

  @override
  Widget getWidget() { return this; }

}

class _ScreenFastState extends State<ScreenFast> {
  
  List<Duration> _times = new List<Duration>();
  RangeValues _currentRangeValues = RangeValues(1, 45);
  @override
  void initState() {
    super.initState();
    const increments = 4;
    Duration duration = Duration(hours: 0);
    for (int i = 0; i < increments*24 + 2; i++) {
      _times.add(duration);
      duration += Duration(minutes: (60/increments).floor());
    }
    print(_times);
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
    Duration start = _times[_currentRangeValues.start.floor()];
    Duration end = _times[_currentRangeValues.end.floor()];
    print(timetoString(start.inMinutes));
    return  Column(
      children: <Widget>[
        WidgetTimer(
          startFast: start,
          endFast: end,
        ),
        RangeSlider(
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
        OutlineButton(
            color: Colors.black,
            textColor: Colors.black,
            padding: EdgeInsets.all(16.0),
            splashColor: Colors.grey,
            highlightedBorderColor: Colors.black,
            borderSide: BorderSide(
              color: Colors.black54,
              width: 1.0,
              style: BorderStyle.solid
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ),
            onPressed: () => {},
            child: Text(
              "End Fast",
              style: TextStyle(fontSize: 16.0)
            )
          ),
      ],
    );
  }
}