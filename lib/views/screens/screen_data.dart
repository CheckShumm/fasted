import 'package:fasted/views/screens/screen.dart';
import 'package:fasted/views/screens/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenData extends StatefulWidget implements ScreenWidget {

  final Screen screen;
  ScreenData({Key key, @required this.screen}) : super(key: key);

  @override
  _ScreenDataState createState() => _ScreenDataState();

  @override
  Screen getScreen() { return screen; }

  @override
  Widget getWidget() { return this; }
}

class _ScreenDataState extends State<ScreenData> {

  @override
  Widget build(BuildContext context) {
    return  Stack(
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