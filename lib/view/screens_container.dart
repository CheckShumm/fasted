import 'package:fasted/view/screens/screen.dart';
import 'package:fasted/view/screens/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fasted/widgets/custom_buttom_navigation_bar.dart';

import 'package:fasted/view/screens/screen_data.dart';
import 'package:fasted/view/screens/screen_fast.dart';
import 'package:fasted/view/screens/screen_health.dart';
import 'package:fasted/view/screens/screen_profile.dart';

class ScreensContainer extends StatefulWidget {
  ScreensContainer({Key key}) : super(key: key);

  final String title = 'fasted';
  final List<Screen> screens = [ ];
  
  final List<ScreenWidget> screenWidgetList = [
    ScreenProfile(screen: new Screen("Profile", Colors.blue, Icons.person_outline)), 
    ScreenFast(screen: new Screen("Fast", Colors.green, Icons.schedule)), 
    ScreenData(screen: new Screen("Data", Colors.amber, Icons.show_chart)), 
    ScreenHealth(screen: new Screen("Health", Colors.red, Icons.favorite_border))
    ];

  @override
  _ScreensContainerState createState() => _ScreensContainerState();
}

class _ScreensContainerState extends State<ScreensContainer> {

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
        child: this.widget.screenWidgetList[_selectedIndex].getWidget()
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        height: heightBottomNavigationBar,
        currentIndex: _selectedIndex,
        screens: List.generate(widget.screenWidgetList.length, 
          (index) => this.widget.screenWidgetList[index].getScreen()
        ),
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          })
        }
      )
    );
  }
}