import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnBoardingAbout extends StatefulWidget {
  OnBoardingAbout({Key key}) : super(key: key);

  @override
  _OnBoardingAboutState createState() => _OnBoardingAboutState();
}

class _OnBoardingAboutState extends State<OnBoardingAbout> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0,64.0,8.0,8.0),
          child: CarouselSlider(
            options: CarouselOptions(height: 200.0),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                return  Card( 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 2.0,
                    child: InkWell(
                      highlightColor: Colors.white,
                      splashColor: Colors.red[200],
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                        "onBoarding: " + i.toString(),
                                        style: TextStyle(
                                          color: Colors.red[300],
                                          letterSpacing: 2.5,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.spa, color: Colors.green[300],)
                                    ],
                                  ),
                                ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 100.0,
                                width: 36.0,
                                color: Colors.red,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                          Icons.person,
                                          color: Colors.white
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                          Icons.share,
                                          color: Colors.white
                                        ),
                                    ),
                                  ]
                                )
                              )
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              );
            }).toList(),
          ),
        )
      ]
    );
  }
}