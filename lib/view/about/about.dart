import 'package:flutter/material.dart';

class About {

  /// protected members
  ColorSwatch _primaryColor;
  String _title;
  IconData _icon;

  About(this._title, this._primaryColor, this._icon);

  // ***** Getters & Setters *****

  /// returns the About's primaryColor
  ColorSwatch getPrimaryColor() { return _primaryColor; }

  /// sets the About's primaryColor
  void setPrimaryColor(ColorSwatch primaryColor) { _primaryColor = primaryColor; }

    /// returns the About's title
  String getTitle() { return _title; }

  /// sets the About's title
  void setTitle(String title) { _title = title; }

    /// returns the About's icon
  IconData getIcon() { return _icon; }

  /// sets the About's icons
  void setIcon(IconData icon) { _icon = icon; }  

}