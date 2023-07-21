import 'package:best_flutter_ui_templates/app_theme.dart';
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
                'assets/fitness_app/start.jpg',
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.fromLTRB(0.0, 45.0, 10.0, 0.0),
              child: OutlinedButton(
                child: new Text(
                  "跳过",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: AppTheme.dark_grey),
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