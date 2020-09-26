
import 'package:flutter/material.dart';

class CustomButtonRaised extends StatelessWidget {
  final double width;
  final String text;
  final Color textColor;
  final Color color;
  final Color splashColor;
  final String iconPath;
  final Function onPressed;

  CustomButtonRaised({
    Key key,
    this.width,
    this.text,
    this.textColor,
    this.color,
    this.splashColor,
    this.iconPath,
    this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: this.width,
        child: RaisedButton(
          color: this.color,
          highlightColor: this.color,
          splashColor: this.splashColor,
          onPressed: this.onPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Stack(
              children: <Widget>[
                if (this.iconPath != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                   Image(image: AssetImage(this.iconPath), height: 24.0)),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      this.text,
                      style: TextStyle(
                        fontSize: 18,
                        color: this.textColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}