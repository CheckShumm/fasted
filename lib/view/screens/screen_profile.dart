import 'package:fasted/view/screens/screen.dart';
import 'package:fasted/view/screens/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenProfile extends StatefulWidget implements ScreenWidget {

  final Screen screen;
  ScreenProfile({Key key, @required this.screen}) : super(key: key);

  @override
  _ScreenProfileState createState() => _ScreenProfileState();

  @override
  Screen getScreen() { return screen; }

  @override
  Widget getWidget() { return this; }

}

class _ScreenProfileState extends State<ScreenProfile> {

  @override
  Widget build(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlineButton(
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
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () => {},
            child: Text(
              "EMAIL",
              style: TextStyle(fontSize: 16.0)
            )
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlineButton(
            color: Colors.red[300],
            textColor: Colors.red[300],
            padding: EdgeInsets.all(16.0),
            splashColor: Colors.red[200],
            highlightedBorderColor: Colors.red[300],
             borderSide: BorderSide(
              color: Colors.red[200],
              width: 1.0,
              style: BorderStyle.solid
            ),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () => {},
            child: Text(
              "GOOGLE",
              style: TextStyle(fontSize: 16.0)
            )
          ),
        ),

      ],
    );
  }
}