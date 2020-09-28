
import 'package:flutter/material.dart';

class OnboardingFast extends StatefulWidget {
  OnboardingFast({Key key}) : super(key: key);

  @override
  _OnboardingFastState createState() => _OnboardingFastState();

}

class _OnboardingFastState extends State<OnboardingFast> {


  Widget _buildCard(String title, String description, String tag) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card( 
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            highlightColor: Colors.white,
            splashColor: Colors.red[200],
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
                            color: Colors.green[300],
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
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
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
                        color: Colors.green[300],
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
    return _buildCard(
      "8 : 16", 
      "Eat in an 8 hour window and then fast for the rest of the day",
      "recommended"
    );
  }
}