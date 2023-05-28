import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("ClimB", style: TextStyle(fontSize: 33)),
            Text("멋있는 슬로건 한마디 어쩌구 저쩌구!"),
            TextField(
              style: TextStyle(fontSize: 15),
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: CupertinoColors.systemGrey5,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white70,
                  size: 15,
                )
              ),
            ),
            Row(
              children: [
                Container(color: CupertinoColors.systemGrey5, child: Text("항목1"),),
                Container(color: CupertinoColors.systemGrey5, child: Text("항목2"),),
                Container(color: CupertinoColors.systemGrey5, child: Text("항목3"),),
                Container(color: CupertinoColors.systemGrey5, child: Text("항목4"),),
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // onTap: _onTap,
            // currentIndex: _currentIndex,
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