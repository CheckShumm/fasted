import 'package:fasted/views/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingContainer extends StatefulWidget {
  OnBoardingContainer({Key key}) : super(key: key);

  final String title = 'fasted';
  final List<Screen> screens = [ ];
  
  final List<Widget> OnBoardingWidgetList = [];


  @override
  _OnBoardingContainerState createState() => _OnBoardingContainerState();
}

class _OnBoardingContainerState extends State<OnBoardingContainer> {

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {

    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    final double heightAppBar = AppBar().preferredSize.height;
    final double heightBottomNavigationBar = 56.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(widget.title, style: TextStyle(fontSize: 20.0, color: Colors.black, letterSpacing: 5.0)),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications),
          ),
        ],
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: Container(
        width: widthScreen,
        height: heightScreen - heightAppBar,
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: this.widget.OnBoardingWidgetList[_selectedIndex]
      ),
    );
  }
}