import 'dart:convert';
import 'package:climing/login/oauth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../home/home.dart';

class Login extends StatelessWidget {

  void _loginWithNaver() {
    // 네이버 로그인 기능 호출
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '이메일 주소',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '비밀번호',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // 로그인 버튼이 눌렸을 때 실행할 코드
                },
                child: Container(
                  child : Center(
                    child: Text('로그인', textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
                  ),
                  // decoration: BoxDecoration(color: Colors.amber),
                  color: Colors.amber,
                  height: 50,
                  width: 300,
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                child: Image.asset('kakao_login2.png', width: 300, height: 50),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent
                ),
                onPressed: (){
                  OAuth.loginWithKakao().then((value) => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      )
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Image.asset('naver_login2.png', width: 300, height: 50),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent
                ),
                onPressed: _loginWithNaver,
              ),
            ],
          ),
        ),
      ),
    );
  }
}