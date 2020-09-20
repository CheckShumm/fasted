import 'package:fasted/views/screens/screen.dart';
import 'package:fasted/views/screens/screen_widget.dart';
import 'package:fasted/widgets/buttons/custom_button_raised.dart';
import 'package:fasted/widgets/timer/widget_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fasted/widgets/buttons/custom_button_outlined.dart';

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
  RangeValues _currentRangeValues = RangeValues(40, 70);
  @override
  void initState() {
    super.initState(); 
    const increments = 4;
    Duration duration = Duration(hours: 0);
    for (int i = 0; i < increments*24 + 2; i++) {
      _times.add(duration);
      duration += Duration(minutes: (60/increments).floor());
    }
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

    // screen dimensions
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double timerWidth = 300;
    double percentHeightTimer = timerWidth / height;

    Duration start = _times[_currentRangeValues.start.floor()];
    Duration end = _times[_currentRangeValues.end.floor()];
    print(timetoString(start.inMinutes));
    return  Column(
      children: <Widget>[
        WidgetTimer(
          width: timerWidth,
          height: timerWidth,
          startFast: start,
          endFast: end
        ),
        
        Padding(
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
        ),

        CustomButtonRaised(
          text: "8 : 16",
          textColor: Colors.white,
          color: Colors.green[300],
          splashColor: Colors.green[50],
          onPressed: () => {
            // go to fasting selection screen
          }
        ),

        CustonButtonOutlined(
          color: Colors.black,
          splashColor: Colors.grey,
          text: "End Fast",
          textColor: Colors.black,
          borderColor: Colors.black,
          width: 300,
        )
      ],
    );
  }
}