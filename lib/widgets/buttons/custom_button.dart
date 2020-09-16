
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  // TODO: make stateless
  final String text;
  final Color textColor;
  final Color color;
  final Color splashColor;
  final String iconPath;
  CustomButton({
    Key key,
    this.text,
    this.textColor,
    this.color,
    this.splashColor,
    this.iconPath
    }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 200,
        child: RaisedButton(
          color: this.widget.color,
          highlightColor: this.widget.color,
          splashColor: this.widget.splashColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Stack(
              children: <Widget>[
                if (this.widget.iconPath != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                   Image(image: AssetImage(this.widget.iconPath), height: 24.0)),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      this.widget.text,
                      style: TextStyle(
                        fontSize: 18,
                        color: this.widget.textColor,
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