import 'dart:convert';
import 'package:climing/join/join_start.dart';
import 'package:climing/login/api/oauth.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../User/user.dart';
import '../home/home.dart';
import '../style/common_style.dart';
import '../widget/button/line_button.dart';
import '../widget/button/main_button.dart';
import '../widget/input/text_lined_input.dart';
import '../widget/layout/header.dart';
import 'api/check_login.dart';

class Login extends StatelessWidget {
  void _loginWithGoogle() {
    // 구글 로그인 기능 호출
  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // body에 들어갈 children list
    List<Widget> childWidgets = [
      TextLinedInput(
        autoFocus: true,
        callback : (){},
        icon: Icons.email,
        hintText: "이메일 주소",
      ),
      TextLinedInput(
        autoFocus: true,
        callback : (){},
        icon: Icons.lock,
        hintText: "비밀번호",
        obscureText: true,
      ),
      // TODO 비밀번호를 잊었나요?
      MainButton(
        label:'로그인',
        callback: () async {
          var user = User(email.text, password.text);
          var check = await CheckLogin.login(user);
          if(check){
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          else{
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                //Dialog Main Title
                title: Column(
                  children: <Widget>[
                    new Text("Dialog Title"),
                  ],
                ),
                //
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dialog Content",
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: new Text("확인"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
            );
          }
        },
      ),
      SizedBox(
        height: 60.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('또는', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))]
        ),
      ),
      LineButton(
        label:'카카오톡으로 로그인',
        callback : (){
          OAuth.loginWithKakao().then((value) => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            )
          });
        },
        icon: Icons.star_border_outlined,
      ),
      LineButton(
        label:'구글 로그인',
        callback: _loginWithGoogle,
        icon: Icons.star_border_outlined,
      ),
      //TODO 여기 위치 조정해야함
      SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('처음 오셨나요? ', style: TextStyle(fontSize: 15, color: Color(0xff5A5A5A),fontWeight:FontWeight.bold)),
              RichText(text: TextSpan(
                  text: '가입하기',
                  style: const TextStyle(
                    color: CommonColor.main,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinStart())
                      );
                  }
                )
              ),
            ], // 색상 바꾸기. TODO 버튼으로 바꾸기
          )
      )
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 회원가입 첫 페이지에는 Footer가 존재하지 않음.
              // Header 20, Body 80
              Header(
                  titleWidget: TitleWidget(title: '어서 오세요!'),
                  subTitleWidget: SubTitleWidget(subTitle: '로그인 화면입니다.'),
                  y: 0.2),
              Body(child: childWidgets, y: 0.8),
            ],
          ),
        ),
      ),
    );
  }
}
