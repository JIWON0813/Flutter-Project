import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../User/user.dart';
import '../login/login.dart';
import '../widget/button/main_button.dart';
import '../widget/layout/body.dart';

// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)

// 화면구분 : 회원가입 완료 페이지
// 주요내용 : 확인 버튼 누를 경우 로그인 페이지로 이동
// 특징 : 상단 Header 위젯 없음. Body로만 구현
class JoinComplete extends StatelessWidget {
  User user;
  JoinComplete({required this.user});

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 4;

    // body에 들어갈 children list
    List<Widget> childWidgets = [
      SizedBox(
        width: 300.0,
        height: 80,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // left
            children: [
              Text('계정 생성 완료',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ] // 아이디 가져오기
        ),
      ),
      SizedBox(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start, // left
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: imageSize,
                  minWidth: imageSize,
                ),
                child: Center(
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: imageSize,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text('아뒤 땡떙' ,style: TextStyle(fontSize: 17, color: Colors.black)),
            ]
        ),
      ),
      SizedBox( // header
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // left
            children: [
              Text('클비에 오신 걸 환영해요!', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
              Text('지금부터 모든 기능을', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
              Text('이용하실 수 있어요.', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
            ] // 아이디 가져오기
        ),
      ),
      MainButton(
        label:'시작!',
        callback: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Login()),
          );
        },
      )
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Body(child: childWidgets), // body 100
            ],
          ),
        ),
      ),
    );
  }
}