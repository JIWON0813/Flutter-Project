import 'package:climing/widget/input/my_input.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';
import '../style/common_style.dart';
import '../widget/input/my_input.dart';

// 화면구분 : 영상 업로드 페이지.
// 영상 기본정보 입력. 영상 업로드 페이지 호출 등
class UploadVideo extends StatefulWidget {
  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  // TODO 스크롤바 처리
  @override
  Widget build(BuildContext context) {
    // body에 들어갈 children list
    List<Widget> childWidgets = [
    Container(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container( // 동영상 상자
              width: double.infinity, // 이미지 박스의 너비
              height: 200, // 이미지 박스의 높이
              decoration: BoxDecoration(
                color:Colors.grey,
                borderRadius: BorderRadius.circular(CommonBorder.basic), // 박스 테두리 둥글기
              ),
              //child: Image.network(
              //imageUrl,
              //imageUrl,
              //fit: BoxFit.cover, // 이미지가 컨테이너에 적절하게 맞도록 설정
              //),
            ),
            Text('위치' ,textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black)),
            MyInput(
              autoFocus: false,
              icon: Icons.place_outlined,
              isBorder: true, // 테두리 기본 색상 넣어줄지
              hintText: "위치 정보를 입력해주세요",
            ),
            Text('문제' ,textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black)),
            MyInput(
              autoFocus: false,
              icon: Icons.flag,
              isBorder: true, // 테두리 기본 색상 넣어줄지
              hintText: "볼드-난이도",
            ),
            Text('유형' ,textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black)),
            MyInput(
              autoFocus: false,
              icon: Icons.filter_center_focus_rounded,
              isBorder: true, // 테두리 기본 색상 넣어줄지
              hintText: "유형 정보를 입력해 주세요",
            ),
            Text('진행도' ,textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.black)),
            MyInput(
              autoFocus: false,
              icon: Icons.incomplete_circle,
              isBorder: true, // 테두리 기본 색상 넣어줄지
              hintText: "진행도를 10 단위로 입력해 주세요",
            )
          ],
        )
      )
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(
                  subTitleWidget: SubTitleWidget(subTitle: '영상 정보 입력', color: Colors.black, icon1: Icons.not_interested_outlined,icon2: Icons.arrow_forward,),
                  y : 0.1),
              Body(child: childWidgets, y : 0.9),
              // TODO 나머지 0.1 FOOTER
            ],
          ),
        ),
      ),
    );
  }
}






