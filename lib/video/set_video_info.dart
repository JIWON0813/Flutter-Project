import 'package:climing/widget/box/my_video_box.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';

// 화면구분 : 영상 업로드 페이지.
// 영상 자르기, 올리기, 영상 기본정보 입력.
class SetVideoInfo extends StatefulWidget {
  @override
  _SetVideoInfo createState() => _SetVideoInfo();
}

class _SetVideoInfo extends State<SetVideoInfo> {
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
              Header(
                  subTitleWidget: SubTitleWidget(subTitle: '영상 정보 입력', color: Colors.black,),
                  y : 0.1),
              Body(child: childWidgets, y : 0.9),
              //Body(child: childWidgets2, y : 0.7),
              // TODO 나머지 0.1 FOOTER
            ],
          ),
        ),
      ),
    );
  }
}





