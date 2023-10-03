import 'package:climing/login/api/oauth.dart';
import 'package:climing/login/api/sns_login.dart';
import 'package:climing/widget/input/my_input.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../join/join_start.dart';
import '../user/member.dart';
import '../home/home.dart';
import '../style/common_style.dart';
import '../widget/button/main_button.dart';
import '../widget/button/my_btn.dart';
import '../widget/input/my_input.dart';
import '../widget/layout/header.dart';
import 'api/check_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 로그인 화면
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.authStateChanges()
    final screenHeight = MediaQuery.of(context).size.height;

    // body에 들어갈 children list
    List<Widget> childWidgets = [
      MyInput(
        autoFocus: true,
        onChangedCallback : (value) {
          setState(() {
            this.userEmail = value;
            print(this.userEmail);
          });
        },
        icon: Icons.email,
        hintText: "이메일 주소",
      ),
      MyInput(
        autoFocus: true,
        icon: Icons.lock,
        hintText: "비밀번호",
        obscureText: true,
      ),
      // TODO 비밀번호를 잊었나요?
      MainButton(
        label:'로그인',
        callback: () async {
          var user = Member(email.text, password.text);
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
        height: screenHeight * 0.07,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('또는', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))]
        ),
      ),
      MyBtn(
        label:'Kakao 로그인',
        backgroundColor: Color(0xffFEE500),
        callback : (){
          OAuth.loginWithKakao().then((value) => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            )
          });
        },
        icon: Icons.apple,
        hasBorder: false,
        //image: Image.asset("testest.png"), 이미지 여기에 넣기
      ),

      MyBtn(
        label:'Google 로그인',
        backgroundColor: Colors.white,
        callback: SnsLogin.withGoogle,
        icon: Icons.apple,
        hasBorder: false,
        //image: Image.asset("testest.png"), 구글 이미지
      ),
      MyBtn(
        label:'Apple 로그인',
        backgroundColor: Colors.black,
        callback: SnsLogin.withApple,
        icon: Icons.apple,
        hasBorder: false,
        //image: Image.asset("testest.png"), 애플 이미지
      ),

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
            ],
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
