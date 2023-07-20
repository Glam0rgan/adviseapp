import 'package:flutter/material.dart';
import 'dart:async';
 
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
 
class _SplashState extends State<Splash>{
 
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              child: new Image.asset(
                'assets/fitness_app/start.png',
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.fromLTRB(0.0, 45.0, 10.0, 0.0),
              child: OutlinedButton(
                child: new Text(
                  "跳过",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white),
                ),
                // StadiumBorder椭圆的形状
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('FAHS');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }
 
  void countDown() {
    var _duration = new Duration(seconds: 30);
    new Future.delayed(_duration, newHomePage);
  }
  void newHomePage() {
    Navigator.pushReplacementNamed(context, '/HomePage');
  }
}