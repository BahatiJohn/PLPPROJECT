import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';
import 'container_box.dart';
import 'data_container.dart';

const activeColor = Color.fromARGB(255, 6, 137, 243);
const inActiveColor = Color.fromARGB(255, 21, 4, 66);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 20;
  int age = 25;
  String result = "";

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: ContainerBox(
                      boxColor: maleBoxColor,
                      childwidget: DataContainer(
                        iconUnicode: '\u{f183}', // Unicode for male icon
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(2);
                      });
                    },
                    child: ContainerBox(
                      boxColor: femaleBoxColor,
                      childwidget: DataContainer(
                        iconUnicode: '\u{f182}', // Unicode for female icon
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: ContainerBox(
                    boxColor: inActiveColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'WEIGHT',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerBox(
                    boxColor: inActiveColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (age < 100) {
                                    age++;
                                  }
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: inActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Developed with ❤ by JOHN BAHATI',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {
                          html.window.open(
                              'https://github.com/BahatiJohn/projectplp',
                              'new_tab');
                        },
                        icon: Icon(Icons.portrait, color: Colors.white),
                        label: Text('Portfolio',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10.0),
                      TextButton.icon(
                        onPressed: () {
                          html.window
                              .open('https://github.com/BahatiJohn', 'new_tab');
                        },
                        icon: Icon(Icons.code, color: Colors.white),
                        label: Text('GitHub',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10.0),
                      TextButton.icon(
                        onPressed: () {
                          html.window.open(
                              'www.linkedin.com/in/john-wavomba/', 'new_tab');
                        },
                        icon: Icon(Icons.work, color: Colors.white),
                        label: Text('LinkedIn',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10.0),
                      TextButton.icon(
                        onPressed: () {
                          html.window.open(
                              'https://twitter.com/the_exxplorer', 'new_tab');
                        },
                        icon: Icon(Icons.message, color: Colors.white),
                        label: Text('Twitter',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                result = calculateBmi(weight, height);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: inActiveColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      title: Text('Your BMI',
                          style: TextStyle(color: Colors.white)),
                      content: Text(result.toString(),
                          style: TextStyle(color: Colors.white)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close',
                              style: TextStyle(color: activeColor)),
                        ),
                      ],
                    );
                  },
                );
              });
            },
            child: Container(
              width: double.infinity,
              height: 80.0,
              color: activeColor,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}

class DataContainer extends StatelessWidget {
  final String iconUnicode;
  final String title;

  DataContainer({required this.iconUnicode, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          iconUnicode,
          style: TextStyle(
              fontSize: 50.0, fontFamily: 'FontAwesome', color: Colors.white),
        ),
      ],
    );
  }
}

class ContainerBox extends StatelessWidget {
  final Color boxColor;
  final Widget childwidget;

  ContainerBox({required this.boxColor, required this.childwidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: childwidget,
    );
  }
}
