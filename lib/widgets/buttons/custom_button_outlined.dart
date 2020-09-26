
import 'package:flutter/material.dart';

class CustonButtonOutlined extends StatelessWidget {

  final String text;
  final Color textColor;
  final Color color;
  final Color splashColor;
  final Color borderColor;
  final String iconPath;
  final double width;
  final Function onPressed;

  CustonButtonOutlined({
    Key key,
    this.text,
    this.textColor,
    this.borderColor,
    this.color,
    this.splashColor,
    this.iconPath,
    this.width,
    this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
          width: this.width,
          child: OutlineButton(
          color: this.color,
          textColor: this.textColor,
          padding: EdgeInsets.all(16.0),
          splashColor: Colors.grey,
          highlightedBorderColor: this.borderColor,
          borderSide: BorderSide(
            color: Colors.black54,
            width: 1.0,
            style: BorderStyle.solid
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
          onPressed: this.onPressed,
          child: Text(
            this.text,
            style: TextStyle(
              wordSpacing: 4.0,
              letterSpacing: 2.0,
              fontSize: 16.0
            )
          )
        ),
    );
  }
}