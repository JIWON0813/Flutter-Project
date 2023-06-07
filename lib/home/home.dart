import 'package:climing/home/home_item.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("ClimB", style: TextStyle(fontSize: 33)),
            Text("멋있는 슬로건 한마디 어쩌구 저쩌구!"),
            TextField(
              style: TextStyle(fontSize: 15),
              autofocus: true,
              decoration: InputDecoration(
                hintText: '검색어를 입력하세요',
                filled: true,
                fillColor: CupertinoColors.systemGrey5,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // 원하는 값을 지정하여 둥글게 조절
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white70,
                  size: 30,
                )
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0), // 원하는 padding 값을 지정
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        double itemSize = constraints.maxWidth / 4; // 너비를 기반으로 항목의 크기 동적으로 계산 (반영이 안됌..)
                        return HomeItem(itemSize: itemSize,color: Colors.indigoAccent, borderRadius: 20, message: '항목${index+1}');
                      },
                    ),
                  );
                },
              )
            ),
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