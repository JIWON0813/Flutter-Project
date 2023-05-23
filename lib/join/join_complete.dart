import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../User/User.dart';
import '../login/login.dart';

// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)

// 화면구분 : 회원가입 완료 페이지
// 주요내용 : 확인 버튼 누를 경우 로그인 페이지로 이동
class JoinComplete extends StatelessWidget {
  User user;
  JoinComplete({required this.user});

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery
        .of(context)
        .size
        .width / 4;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // left
            children: [
              SizedBox( // header
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
                width: 300.0,
                height: 300.0,
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
                      Text('아뒤 땡떙' ,style: TextStyle(fontSize: 18, color: Colors.black)),
                    ]
                ),
              ),
              SizedBox( // header
                width: 300.0,
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('클비에 오신 걸 환영해요!', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
                      Text('지금부터 모든 기능을', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
                      Text('이용하실 수 있어요.', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
                    ] // 아이디 가져오기
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 55.0,
                child:
                TextButton(
                  child: const Text('시작!', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Login()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFF4AA1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}