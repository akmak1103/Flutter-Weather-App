import 'dart:async';

import 'package:flutter/material.dart';
import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff43cea2),
                  Color(0xff185a9d)
                ]),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Weather App',style: TextStyle(color: Colors.white,fontSize: 50,fontFamily:'Montserrat'),),
            ],
          ),
        ),
      ),
    );
  }
}
