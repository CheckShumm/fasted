import 'package:flutter/material.dart';

class Screen {

  /// protected members
  ColorSwatch _primaryColor;
  String _title;
  IconData _icon;

  Screen(this._title, this._primaryColor, this._icon);

  // ***** Getters & Setters *****

  /// returns the screen's primaryColor
  ColorSwatch getPrimaryColor() { return _primaryColor; }

  /// sets the screen's primaryColor
  void setPrimaryColor(ColorSwatch primaryColor) { _primaryColor = primaryColor; }

    /// returns the screen's title
  String getTitle() { return _title; }

  /// sets the screen's title
  void setTitle(String title) { _title = title; }

    /// returns the screen's icon
  IconData getIcon() { return _icon; }

  /// sets the screen's icons
  void setIcon(IconData icon) { _icon = icon; }  

}