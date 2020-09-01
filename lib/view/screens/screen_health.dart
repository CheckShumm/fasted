import 'package:fasted/view/screens/screen.dart';
import 'package:fasted/view/screens/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenHealth extends StatefulWidget implements ScreenWidget {

  final Screen screen;

  ScreenHealth({Key key, @required this.screen}) : super(key: key);

  @override
  _ScreenHealthState createState() => _ScreenHealthState();

  @override
  Screen getScreen() { return screen; }

  @override
  Widget getWidget() { return this; }
  
}

class _ScreenHealthState extends State<ScreenHealth> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        FlatButton(
          color: this.widget.screen.getPrimaryColor()[300],
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          splashColor: this.widget.screen.getPrimaryColor()[500],
          onPressed: () => {},
          child: Text(
            this.widget.screen.getTitle(),
            style: TextStyle(fontSize: 16.0)
          )
        ),
      ],
    );
  }
}