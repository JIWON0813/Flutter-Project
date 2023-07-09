import 'package:flutter/widgets.dart';
// 회색 타원형 라벨 위젯입니다.
// 메뉴 위치 예시 : 내 영상 포스팅 하기
// ex) 내 포스팅 → 1레벨, 밸런스
class GreyEllipseLabel extends StatefulWidget {
  final String title; // 레벨값 OR 다이내믹, 밸런스, 파워, 지구력 등 유형등 회색 타원형 안에 들어갈 라벨 타이틀
  const GreyEllipseLabel({Key? key, required this.title}) : super(key: key);

  @override
  _GreyEllipseLabel createState() => _GreyEllipseLabel();
}

class _GreyEllipseLabel extends State<GreyEllipseLabel> {

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        right: 7.0,
      ),
      padding:EdgeInsets.only(
        left: 12.0,
        right: 12.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Color(0xff9E9E9E))),
    );
  }
}



