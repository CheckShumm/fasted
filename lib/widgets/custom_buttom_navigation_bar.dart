import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fasted/views/screens/screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final backgroundColor = Colors.white;
  final double height = 56.0;
  final List<Screen> screens;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    Key key,
    @required this.currentIndex, 
    @required this.onTap, 
    @required this.screens,
    backgroundColor, 
    height
    }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      backgroundColor: this.widget.backgroundColor,
      selectedIndex: this.widget.currentIndex,
      containerHeight: this.widget.height,
      showElevation: false,
      onItemSelected: (index) => this.widget.onTap(index),
      items: 
        new List.generate(this.widget.screens.length, (index) => 
          new BottomNavyBarItem(
            icon: Icon(this.widget.screens[index].getIcon()),
            title: Text(this.widget.screens[index].getTitle()),
            activeColor: this.widget.screens[index].getPrimaryColor(),
          )
        ),
    );
  }
}
