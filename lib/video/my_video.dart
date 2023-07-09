import 'package:climing/widget/box/my_video_box.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';

// 화면구분 : 내 영상
// 주요내용 : 영상 업로드 및 삭제 등 영상 관리 기능
// 특징 : 영상이 있는 경우 등록된 영상 리스트 보여주기, 영상이 없는 경우 "아직 아무것도 업로드 하지 않았네요. 영상을 올려서 공유해 보세요!" 메시지 출력
// DB 설계 완료되고 동영상 리스트 가져오면, 반복문으로 MyVideoBox 사용할 수 있도록 수정 예정

class MyVideo extends StatefulWidget {
  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  // TODO 스크롤바 처리
  @override
  Widget build(BuildContext context) {
    // body에 들어갈 children list
    List<Widget> childWidgets = [
      MyVideoBox(type:'파워', likeCnt: 130,),
      MyVideoBox(likeCnt: 135,),
      MyVideoBox(likeCnt: 170,),
      MyVideoBox(success: false,completeRatio: 80,)
    ];

    // 비디오 하나도 없는 경우 빈 화면 보여주기
    List<Widget> childWidgets2 = [
      Container( // 2. 포스팅 타이틀,
        child:
        Column(
          children: [
            Icon(Icons.file_copy),
            Text('아직 아무것도 업로드 하지 않았네요.'),
            Text('영상을 올려서 공유해 보세요!'),
          ],
        )
      ),
    ];


    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(menuTitle: '내 포스팅',menuDetail: '내가 올린 포스팅을 확인해 보세요', y : 0.2),
              Body(child: childWidgets2, y : 0.7),
              // TODO 나머지 0.1 FOOTER
            ],
          ),
        ),
      ),
    );
  }
}





