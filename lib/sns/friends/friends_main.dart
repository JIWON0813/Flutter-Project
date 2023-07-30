import 'package:climing/sns/friends/friends_search.dart';
import 'package:climing/style/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'friends_select.dart';

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

  final List<Map<String, dynamic>> data = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Title 1',
      'body': 'Body 1',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Title 2',
      'body': 'Body 2',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Title 3',
      'body': 'Body 3',
    },
  ];

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
              Text("나의 도전에 함께하는 친구들!", style: TextStyle(color: Colors.grey, fontSize: 15), textAlign: TextAlign.left),
              GestureDetector(
                child: Icon(Icons.person_add_alt_1_outlined, size: 25,),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FriendsSearch())
                  );
                },
              )

            ],
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 10),
          Container(
            width: 400,
            height: 400,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    FriendsSelect.showCustomDialog(context, '알림', '${index} 팝업입니다.');
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index]['image']),
                      ),
                      title: Text(data[index]['title']),
                      subtitle: Text(data[index]['body']),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}