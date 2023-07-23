import 'package:climing/style/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// 메인 타원형 라벨 위젯입니다.
// 메뉴 위치 예시 : 내 영상 포스팅 하기 → 메인 색상 성공, 달성률 라벨
// ex) 내 포스팅 → ex) 성공, 80%, ..., etc
class MainEllipseLabel extends StatefulWidget {
  final String title; // 라벨 들어갈 라벨 타이틀
  final bool success ; // 라벨 들어갈 라벨 타이틀
  const MainEllipseLabel({Key? key,
    required this.title,
    required this.success
  }) : super(key: key);

  @override
  _MainEllipseLabel createState() => _MainEllipseLabel();
}

class _MainEllipseLabel extends State<MainEllipseLabel> {

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        right: 7.0,
      ),
      padding:EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        color: widget.success == true ? CommonColor.main : CommonColor.grey100,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: widget.success == true ? Colors.white : CommonColor.grey200)),
    );
  }
}



