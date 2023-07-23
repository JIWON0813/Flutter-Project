import 'package:climing/widget/box/my_video_box.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';

// 화면구분 : 업로드 영상 자르기 등 편집 → 기획 확인 후 처리해야함

class EditVideo extends StatefulWidget {
  @override
  _EditVideo createState() => _EditVideo();
}

class _EditVideo extends State<EditVideo> {
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
                  titleWidget: TitleWidget(title: '내 포스팅'),
                  subTitleWidget: SubTitleWidget(subTitle: '내가 올린 포스팅을 확인해 보세요'),
                  y : 0.2),
              Body(child: childWidgets, y : 0.7),
              //Body(child: childWidgets2, y : 0.7),
              // TODO 나머지 0.1 FOOTER
            ],
          ),
        ),
      ),
    );
  }
}





