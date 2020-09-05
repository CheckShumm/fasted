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

  List _list = ["Health", "Health", "Health", "Health"];

  Widget _buildCard(title) {
    return 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card( 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            highlightColor: Colors.white,
            splashColor: Colors.red[200],
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                              title,
                              style: TextStyle(
                                color: Colors.red[300],
                                letterSpacing: 2.5,
                                ),
                              ),
                            ),
                            Icon(Icons.spa, color: Colors.green[300],)
                          ],
                        ),
                      ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 100.0,
                      width: 36.0,
                      color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                                Icons.person,
                                color: Colors.white
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                                Icons.favorite_border,
                                color: Colors.white
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                                Icons.share,
                                color: Colors.white
                              ),
                          ),
                        ]
                      )
                    )
                  ),
                ],
              ),
            ),
          )
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: _list.map((card) =>_buildCard(card)).toList()
    );
  }
}