import 'package:flutter/material.dart';
import '../../style/common_style.dart';

// 공통 버튼용 위젯
class MyBtn extends StatelessWidget{
  final String label; // 버튼에 입력할 문자열
  final double fontSize; // 버튼에 입력할 문자 크기
  final Color textColor; // 버튼 내에 사용할 문자의 색상
  final TextAlign textAlign; // 버튼 내에 사용할 문자 위치
  final IconData? icon; // 버튼에 사용할 아이콘 (필수 사용  X)
  final Color backgroundColor; // 버튼 색상
  final Color borderColor; // 버튼 테두리 색상
  final VoidCallback callback; // 버튼 클릭시 실행할 메서드
  final Widget? image; // 버튼에 사용할 이미지
  final bool hasBorder; // 버튼에 사용할 이미지

  MyBtn({
    Key? key,
    this.label = "기본버튼", // 버튼 내부 문자열 필수
    this.fontSize = 15,
    this.textColor = CommonColor.grey300,
    this.textAlign = TextAlign.center,
    this.icon,
    this.backgroundColor = CommonColor.main,//Colors.transparent,
    this.borderColor = Colors.white,
    required this.callback,
    this.image,
    this.hasBorder = true
  }):super(key:key);


  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이

    List<Widget> childWidgets = [];
    if(this.icon != null) {
      childWidgets = [
        Icon(
          this.icon,
          //color: Colors.white,
        ),
        Text(this.label, textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15,
                color: this.textColor,
                fontWeight: FontWeight.bold)),
      ];
    }else if(this.image != null){
      childWidgets = [
        this.image!, // null 아님
        Text(this.label, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: this.textColor, fontWeight:FontWeight.bold)),
      ];
    }
    else{
      childWidgets = [
        Text(this.label, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: this.textColor, fontWeight:FontWeight.bold)),
      ];
    }

    return Container(
      height: screenHeight * 0.07, // 기기 세로 길이의 7%
      width: double.infinity, // Occupy full width 버튼 가로길이 현재 가능 영역에서 꽉차게 그리기
      margin: EdgeInsets.only(
        top: screenHeight * CommonMargin.basic,
        bottom: screenHeight * CommonMargin.basic,
        left: 0,
        right: 0,
      ),
      child:
        OutlinedButton(
          style: OutlinedButton.styleFrom( // border
            side: this.hasBorder ? BorderSide(color :CommonColor.main) : BorderSide.none,
            backgroundColor: this.backgroundColor,
          ),
          onPressed: (){
            this.callback();
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: childWidgets
            ),
        ),
    );
  }
}



