import 'dart:convert';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../User/user.dart';
import 'package:climing/widget/input/text_lined_input.dart';

import '../widget/button/main_button.dart';
import 'join_complete.dart';
// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)


class DetailSet extends StatefulWidget {
  User user;
  DetailSet({required this.user});

  @override
  _DetailSetState createState() => _DetailSetState();
}

// 화면구분 : 회원가입 첫 페이지
// 주요내용 : 이메일, 비밀번호 입력
class _DetailSetState extends State<DetailSet> {
// 화면구분 : 회원가입 세번째 페이지 (더 자세한 정보)
// 주요내용 : 키,몸무게,클라이밍경력,지역 입력

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
      Container(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start, // left
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('키' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              TextLinedInput(
                autoFocus: true,
                callback : (){},
                textInputFormatter: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                hintText: "cm",
              ),

              Text('몸무게' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              TextLinedInput(
                autoFocus: false,
                callback : (){},
                textInputFormatter: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                hintText: "kg",
              ),
              Text('클라이밍 경력' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              TextLinedInput(
                autoFocus: false,
                callback : (){},
                hintText: "(ex: 3회, 6개월, 2년 등)",
              ),
              Text('주로 활동하는 지역' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              TextLinedInput(
                autoFocus: false,
                callback : (){},
                hintText: "지역 선택 드롭다운 찾아야함",
              ),

              MainButton(
                label:'입력완료',
                callback: () async{
                  _requestJoin();
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>JoinComplete(user:widget.user)),
                  );
                },
              )

            ]
        ),
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Header(
                  titleWidget: TitleWidget(title: '더 자세한 정보'),
                  subTitleWidget: SubTitleWidget(subTitle: '아이디(변동값주기) 님에 대해서 좀 더 알려 주세요'),
                  y: 0.2),
              Body(child: childWidgets, y: 0.8),
            ],
          ),
        ),
      ),
    );
  }
}





