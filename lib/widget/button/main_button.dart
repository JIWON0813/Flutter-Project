import 'package:climing/style/common_style.dart';
import 'package:flutter/material.dart';

import '../layout/layout.dart';

// 기본 버튼을 위한 위젯입니다.
// 파라미터 넘기지 않고 DEFAULT 사용하는 경우 전체 화면에서 공통으로 쓰이는 핑크색 버튼으로 적용 → 추후 메인 색상 변경되면 한번에 전부 변경 가능함
class StaticColor {
  static const Color pink1 = const Color(0xffFF4AA1); // 현재 메인 색상
}

class MainButton extends StatelessWidget{
  final String label; // 버튼 내에 사용할 문자
  final double fontSize; // 버튼 내에 사용할 문자의 크기
  final Color textColor; // 버튼 내에 사용할 문자의 색상
  final TextAlign textAlign; // 버튼 내에 사용할 문자 위치
  final IconData? icon; // 버튼에 사용할 아이콘 (필수 사용  X)
  final Color backgroundColor; // 버튼 색상
  final Color borderColor; // 버튼 테두리 색상
  final VoidCallback callback; // 버튼 클릭시 실행할 메서드
  final double x; //기기화면 전체 가로 길이 대비 만들고 싶은 가로 길이 비율 ex) 1 → 가로 꽉 채우는 경우
  final double y; //기화면 전체 높이 길이 대비 만들고 싶은 높이 길이 비율 ex) 0.8

  MainButton({
    Key? key,
    this.label = "기본버튼", // 버튼 내부 문자열 필수
    this.fontSize = 15,
    this.textColor = Colors.white,
    this.textAlign = TextAlign.center,
    this.icon,
    this.backgroundColor = CommonColor.main,
    this.borderColor = CommonColor.main,
    this.x = 1, // 가로 요청 비율 안넘어오는 경우 기본값
    this.y = 0.07,  // 세로 요청 비율 안넘어오는 경우 기본값
    required this.callback
  }):super(key:key);


  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width; // 기기 전체 가로 길이 → 매번 호출하지 않고, 한 파일에서 관리해도 될듯
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이  → 매번 호출하지 않고, 한 파일에서 관리해도 될듯

    return Container(
      height: screenHeight * y,
      width: double.infinity, // Occupy full width 버튼 가로길이 현재 가능 영역에서 꽉차게 그리기
      margin: EdgeInsets.only(
        top: screenHeight * CommonMargin.basic,
        bottom: screenHeight * CommonMargin.basic,
        left: 0,
        right: 0,
      ),
      child:
      TextButton(
        child: Text(this.label, textAlign: this.textAlign, style: TextStyle(fontSize: this.fontSize, color: this.textColor)),
        onPressed: (){
          this.callback();
        },
        style: TextButton.styleFrom(
          backgroundColor: this.backgroundColor,
        ),
      ),
    );
  }
}