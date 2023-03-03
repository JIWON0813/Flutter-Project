import 'package:flutter/cupertino.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('파일을 업로드 할 공간\n동영상 보여주기', textScaleFactor : 3,),
    );
  }
}