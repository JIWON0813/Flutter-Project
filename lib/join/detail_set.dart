import 'dart:convert';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../User/user.dart';
import '../widget/button/main_button.dart';
import 'join_complete.dart';

// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)

// 화면구분 : 회원가입 세번째 페이지 (더 자세한 정보)
// 주요내용 : 키,몸무게,클라이밍경력,지역 입력
class DetailSet extends StatelessWidget {
  User user;
  DetailSet({required this.user});
  // 다음 버튼 클릭시 페이지 이동 & 파라미터 전달

  // 회원가입 임시 요청
  static _requestJoin() async{
    print('this1');
    Map data = { 'email' : 'miso100422@threecount.com', 'name' : 'mimip', 'password':'test' };
    var body = json.encode(data);

    try{
      var response = await http.post(Uri.parse('http://localhost:8080/api/user/join'),  headers: {"Content-Type": "application/json"}, body:body);
      print('this2');
      var result = jsonDecode(response.body);
      print(result);
      return result;
    }
    catch(error){
      return Future.error(error);
    }

  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 4;
    // body에 들어갈 children list
    List<Widget> childWidgets = [
      SizedBox(
        width: 300.0,
        height: 70.0,
        child: Row(
            children: [
              SizedBox(
                width: 250,
                child:
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                  onChanged: (value){
                  },
                  autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                  validator:(value){ // 유효성검사
                  },
                  decoration: // 스타일 설정
                  InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '키',
                  ),
                ),
              ),
              SizedBox(
                  width: 50,
                  child:
                  Text('cm', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
            ]
        ),
      ),
      SizedBox(
        width: 300.0,
        height: 70.0,
        child: Row(
            children: [
              SizedBox(
                width: 250,
                child:
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                  onChanged: (value){
                  },
                  autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                  validator:(value){ // 유효성검사
                  },
                  decoration: // 스타일 설정
                  InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '몸무게',
                  ),
                ),
              ),
              SizedBox(
                  width: 50,
                  child:
                  Text('kg', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
            ]
        ),
      ),

      SizedBox(
        width: 300.0,
        height: 90.0,
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start, // left
            children: [
              Text('주로 활동하는 지역' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                onChanged: (value){
                  user.id = value as String; // 아이디 할당
                  print(value);
                },
                autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                validator:(value){ },
                decoration: // 스타일 설정
                InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '드롭다운찾아보고 있음',
                ),
              )
            ]
        ),
      ),
      MainButton(
        label:'입력완료',
        callback: () async{
          _requestJoin();
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>JoinComplete(user:user)),
          );
        },
      ),
      //TextInput(
        //autoFocus: false,
        //callback : (){},
        //icon: Icons.person_outline_rounded,
        //hintText: "(ex: 3회, 6개월, 2년 등)",
        //obscureText: false,  ########################### 여기 추가가 안됨
      //),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Header(menuTitle: '더 자세한 정보',menuDetail: '아이디(변동값주기) 님에 대해서 좀 더 알려 주세요!', y: 0.2),
              Body(child: childWidgets, y: 0.8),
            ],
          ),
        ),
      ),
    );
  }
}





