import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsMain extends StatefulWidget{
  _FriendsMainState createState() => _FriendsMainState();
}

class _FriendsMainState extends State<FriendsMain> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _FriendsMainState(){
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("친구", style: TextStyle(fontSize: 33), textAlign: TextAlign.left),
          SizedBox(height: 10),
          Text("나의 도전에 함께하는 친구들!", style: TextStyle(color: Colors.grey), textAlign: TextAlign.left),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(fontSize: 15),
            autofocus: true,
            decoration: InputDecoration(
                hintText: '검색',
                filled: true,
                //fillColor: CupertinoColors.systemGrey5,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pinkAccent),
                  borderRadius: BorderRadius.circular(20), // 원하는 값을 지정하여 둥글게 조절
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white70,
                  size: 30,
                )
            ),
          ),
        ],
      ),
    );
  }
}