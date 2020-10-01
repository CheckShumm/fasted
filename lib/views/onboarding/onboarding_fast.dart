
import 'package:flutter/material.dart';

class OnboardingFast extends StatefulWidget {
  OnboardingFast({Key key}) : super(key: key);

  @override
  _OnboardingFastState createState() => _OnboardingFastState();

}

class _OnboardingFastState extends State<OnboardingFast> {


  Widget _buildCard(
    String title, String description, String tag,
    MaterialColor primaryColor, Color labelColor
    ) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card( 
          color: primaryColor[300],
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            splashColor: primaryColor[300],
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: 300,
              height: 100,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: primaryColor[300],
                                fontSize: 11,
                              )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 0,
                        fontSize: 14
                      ),
                    ),
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
    return Column(
      children: [
        _buildCard(
          "10 : 14", 
          "Eat in a 10 hour window and then fast for the rest of the day",
          "easy",
          Colors.green,
          Colors.red
        ),
        _buildCard(
          " 8 : 16", 
          "Eat in an 8 hour window and then fast for the rest of the day",
          "recommended",
          Colors.lightBlue,
          Colors.red
        ),
        _buildCard(
          " 6 : 18", 
          "Eat in an 6 hour window and then fast for the rest of the day",
          "intermediate",
          Colors.orange,
          Colors.red
        ),
        _buildCard(
          " 4 : 20", 
          "Eat in an 4 hour window and then fast for the rest of the day",
          "difficult",
          Colors.purple,
          Colors.red
        ),
      ]
    );
  }
}