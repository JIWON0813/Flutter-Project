import 'package:climing/style/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MessageMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("뭔가 문구 한마디 써있으면...", style: TextStyle(color: Colors.grey, fontSize: 15), textAlign: TextAlign.left),
              Icon(Icons.add_comment, size: 25,)
            ],
          ),
          SizedBox(height: 15),
          TextField(
            style: TextStyle(fontSize: 15),
            autofocus: true,
            decoration: InputDecoration(
                hintText: '검색',
                filled: true,
                //fillColor: CupertinoColors.systemGrey5,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: CommonColor.main),
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
