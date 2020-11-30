import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const duration = const Duration(seconds: 1);

  bool isActive = false;
  int secondPassed = 0;

  Timer timer;

  void handleTick() {
    if (isActive) {
      secondPassed = secondPassed + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondPassed % 60;
    int minutes = secondPassed ~/ 60;
    int hours = secondPassed ~/ (60 * 60);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Center(child: Text('Timer')),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(
                      label: 'HRS',
                      value: hours.toString().padLeft(2, '0'),
                    ),
                    LabelText(
                      label: 'MIN',
                      value: minutes.toString().padLeft(2, '0'),
                    ),
                    LabelText(
                      label: 'SEC',
                      value: seconds.toString().padLeft(2, '0'),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      isActive = isActive;
                    });
                  },
                  child: Text(isActive ? 'STOP' : 'START'),
                )
              ],
            ),
          ),
        ));
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue
      ),
      child: Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text('$value', style: TextStyle(color: Colors.white, fontSize: 50),),
        Text('$label', style: TextStyle(color: Colors.white70,),)
      ],),
    );
  }
}
