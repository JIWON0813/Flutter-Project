import 'package:flutter/material.dart';

// 핑크색 기본 버튼을 위한 위젯입니다.
// 버튼 배경색상 변경 가능, 단 버튼크기는 전체 스타일에서 동일하게 적용함.
class StaticColor {
  static const Color pink1 = const Color(0xffFF4AA1);
}

class MainButton extends StatelessWidget{
  final String label; // 버튼 내에 사용할 문자
  final double fontSize; // 버튼 내에 사용할 문자의 크기
  final Color textColor; // 버튼 내에 사용할 문자의 색상
  final TextAlign textAlign; // 버튼 내에 사용할 문자 위치
  final IconData? icon; // 버튼에 사용할 아이콘 (필수 사용  X)
  final Color backgroundColor; // 버튼 색상
  final Color borderColor; // 버튼 테두리 색상
  final double width; // 버튼 가로 사이즈 기본값
  final double height; // 버튼 세로 사이즈 기본값
  final VoidCallback callback; // 버튼 클릭시 실행할 메서드

  MainButton({
    Key? key,
    this.label = "기본버튼", // 버튼 내부 문자열 필수
    this.fontSize = 15,
    this.textColor = Colors.white,
    this.textAlign = TextAlign.center,
    this.icon,
    this.backgroundColor = StaticColor.pink1,
    this.borderColor = StaticColor.pink1,
    this.width = 300,
    this.height = 55,
    required this.callback
  }):super(key:key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: this.width,
      height: this.height,
      child:
      TextButton(
        child: Text(this.label, textAlign: this.textAlign, style: TextStyle(fontSize: this.fontSize, color: this.textColor)),
        onPressed: (){
          this.callback();
        },
        // onPressed:  () async{
        //   _requestJoin();
        //   final result = await Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context)=>JoinComplete(user:user)),
        //   );
        //},
        style: TextButton.styleFrom(
          backgroundColor: this.backgroundColor,
        ),
      ),
    );
  }
}