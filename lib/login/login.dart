import 'dart:convert';
import 'package:climing/login/api/oauth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../User/user.dart';
import '../home/home.dart';
import '../widget/button/main_button.dart';
import 'api/check_login.dart';

class Login extends StatelessWidget {
  void _loginWithNaver() {
    // 네이버 로그인 기능 호출
  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                        controller: email,
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
                        controller: password,
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
              SizedBox(
                width: 350,
                height: 80,
                child: MainButton(
                  label: '로그인',
                  callback: () async {
                    var user = User(email.text, password.text);
                    CheckLogin.login(user);
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                child: Image.asset('kakao_login2.png', width: 300, height: 50),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: () {
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
                    backgroundColor: Colors.transparent),
                onPressed: _loginWithNaver,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
