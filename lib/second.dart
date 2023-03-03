import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('개인정보 변경'),
          onTap: (){
            Navigator.pushNamed(context, 'routeName');
          },
        ),
        ListTile(
          title: Text('알람'),
          onTap: (){
            Navigator.pushNamed(context, 'routeName');
          },
        ),
      ],
    );
  }
}