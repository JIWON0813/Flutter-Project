import 'dart:async';
import 'package:climing/video/my_video.dart';
import 'package:flutter/material.dart';
import '../join/join_start.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        //MaterialPageRoute(builder: (context) => Login()), // 페이지 호출
        //MaterialPageRoute(builder: (context) => JoinStart()), // 페이지 호출
        MaterialPageRoute(builder: (context) => MyVideo()), // 페이지 호출
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}