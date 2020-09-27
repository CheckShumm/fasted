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
  
  // states
  bool _fasting;
  DateTime _timeStart;
  DateTime _timeEnd;

  @override
  void initState() {
    super.initState();
    DateTime current = DateTime.now();
    _timeStart = DateTime(current.year, current.month, current.day, 18, 30);
    _timeEnd = DateTime(current.year, current.month, current.day, 13, 15);
    _fasting = true; // TODO read start time and compute this
  }

  Duration computeFastDuration(DateTime currentTime) {
    DateTime time = (_fasting ? _timeStart : _timeEnd);
    return time.difference(DateTime.now());
  }

  String timeToString(DateTime time) {
    return time.hour.toString() + "h " + time.minute.toString() + "m";
  }

  @override
  Widget build(BuildContext context) {

    // screen dimensions
    double width = MediaQuery.of(context).size.width;
    double timerWidth = width*0.75;
    
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        WidgetTimer(
          width: timerWidth,
          height: timerWidth,
          fastStart: _timeStart,
          fastEnd: _timeEnd,
          computeFastDuration: (currentTime) => computeFastDuration(currentTime),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "started",
                    style: TextStyle(
                      fontSize: 12
                    )
                  ),
                  Text(
                    timeToString(_fasting ? _timeStart : _timeEnd),
                    style: TextStyle(
                      fontSize: 32
                    )
                  ),
                ],
              ),
              CustomButtonRaised(
                text: "8 : 16",
                width: 100,
                textColor: Colors.white,
                color: Colors.green[300],
                splashColor: Colors.green[50],
                onPressed: () => {
                  // go to fasting selection screen
                }
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustonButtonOutlined(
            color: Colors.black,
            splashColor: Colors.grey,
            text: (_fasting ? "End " : "Start ") + "fast",
            textColor: Colors.black,
            borderColor: Colors.black,
            width: width * 0.80,
            onPressed: () {
              setState((){_fasting = !_fasting;});
            }
          ),
        )
      ],
    );
  }
}