import 'package:climing/home/home_item.dart';
import 'package:climing/home/home_main.dart';
import 'package:climing/sns/friends/friends_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user_info.dart';
import '../video/my_video.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _currentIndex = 0;

  final List<Widget> _children = [HomeMain(), FriendsMain(), Home(), MyVideo(), UserInfo()];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.widgets),
                label: '',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, color: Colors.pinkAccent, size: 50,),
                label: '',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.widgets),
                label: '',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              )
            ]
        )
    );
  }
}