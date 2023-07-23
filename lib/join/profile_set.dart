import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';
import '../User/user.dart';
import '../widget/button/main_button.dart';
import '../widget/input/text_lined_input.dart';
import '../widget/layout/body.dart';
import 'detail_set.dart';

// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)

// 화면구분 : 회원가입 두번째 페이지 (더 자세한 정보)
// 주요내용 : 아이디,프로필 사진 등록
class ProfileSet extends StatelessWidget {
  User user;
  ProfileSet({required this.user});

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 6;
    // body에 들어갈 children list
    List<Widget> childWidgets = [
      Text('아이디' ,style: TextStyle(fontSize: 18, color: Colors.black)),
      TextLinedInput(
        autoFocus: true,
        callback : (){},
        icon: Icons.person_outline_rounded,
        hintText: "아이디",
      ),
      SizedBox(
        width: 300.0,
        height: 200.0,
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start, // left
            children: [
              Text('프로필사진' ,style: TextStyle(fontSize: 18, color: Colors.black)),
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
            ]
        ),
      ),
      SizedBox(
        width: 300.0,
        height: 55.0,

        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('지금은건너뛰기', style: TextStyle(decoration: TextDecoration.underline,fontSize: 15, color: Colors.grey,fontWeight:FontWeight.bold)), // 색상 바꾸기. TODO 버튼으로 바꾸기
                onPressed:  () async{
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>DetailSet(user:user)),
                  );
                },
              ),
            ]
        ),
      ),
      SizedBox(height: 16.0),
      MainButton(
        label:'다음',
        callback: () async{
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>DetailSet(user:user)),
          );
        },
      )
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // left
            children: [
              Header(menuTitle: '계정설정',menuDetail: '계정을 설정합니다', y: 0.2),
              Body(child: childWidgets, y: 0.8),
            ],
          ),
        ),
      ),
    );
  }
}
