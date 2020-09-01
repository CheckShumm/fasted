
import 'package:fasted/view/screens/screen.dart';
import 'package:flutter/widgets.dart';

abstract class ScreenWidget {

  // returns screen data
  Screen getScreen();

  // returns screen widget
  Widget getWidget();

}