import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../style/common_style.dart';

// 이메일, 아이디 등 텍스트 입력하는 input 상자 생성용 위젯
class MyInput extends StatefulWidget {
  final String hintText; // input 상자 내부 placeholder
  final double fontSize; // 버튼 내에 사용할 문자의 크기
  final Color textColor; // 버튼 내에 사용할 문자의 색상
  final TextAlign textAlign; // 버튼 내에 사용할 문자 위치
  final IconData? icon; // 버튼에 사용할 아이콘 (필수 사용  X)
  final Color backgroundColor; // 버튼 색상
  final bool? isBorder; // 버튼 테두리 색상
  //final VoidCallback? onChangedCallback; // onChanged 실행 메서드
  final Function(String)? onChangedCallback; // onChanged 실행 메서드
  final bool autoFocus; // text 상자 자동 포커스
  final bool obscureText; // 문자 ***로 보이게
  final List<TextInputFormatter>? textInputFormatter; // 텍스트 유효성 검사용

  MyInput({
    Key? key,
    this.hintText = "placeholder", // input 상자 내부 placeholder
    this.fontSize = 15,
    this.textColor = CommonColor.grey300,
    this.textAlign = TextAlign.center,
    this.icon,
    this.backgroundColor = Colors.white,
    this.isBorder = false,
    this.onChangedCallback,
    this.textInputFormatter,
    this.autoFocus = false,
    this.obscureText = false
  }) :super(key: key);

  @override
  _MyInput createState() => _MyInput();
}

class _MyInput extends State<MyInput> {
  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이  → 매번 호출하지 않고, 한 파일에서 관리해도 될듯

    return Container(
      width: double.infinity, // Occupy full width 버튼 가로길이 현재 가능 영역에서 꽉차게 그리기
      margin: EdgeInsets.only(
        top: screenHeight * CommonMargin.basic,
        bottom: screenHeight * CommonMargin.basic,
        left: 0,
        right: 0,
      ),
      child:
      TextFormField(
        // keyboardType: TextInputType.emailAddress, // @ 존재하는 키패드 열기
        autofocus: widget.autoFocus, // 자동 focus 줄건지
        obscureText: widget.obscureText, // input 상자에 ***로 암호화 표시 할건지
        onChanged: (value){
          // 입력값 변경 콜백 함수 호출
          if(widget.onChangedCallback != null){
            widget.onChangedCallback!(value);
          }
          // email = value as String;
          // TODO print(value); 각각의 input 상자 고유 키값(name) 가지고 value 할당하도록 수정 필요
        },
        onSaved: (value){
        },
        autovalidateMode: AutovalidateMode.always,
        validator:(value){
          // if(value!.isEmpty){
          //   return "email";
          // }
          return null;
        },
        decoration:
          InputDecoration(
            prefixIcon: widget.icon != null ? Icon(widget.icon, size: 30) : null ,// TODO 사이즈도 비율에 따라서 변경 필요함
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(CommonBorder.basic),
              borderSide: widget.isBorder == true ? BorderSide(color: CommonColor.main, width: 1.0): BorderSide(width: 0.0, style: BorderStyle.none), // Remove the default border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(CommonBorder.basic),
              borderSide: BorderSide(color: CommonColor.main, width: 1.0), // 포커스 되었을 때 input 상자
            ),
            hintText: widget.hintText,
            filled: true,
            fillColor: CommonColor.grey100, // Set the desired background color,
            contentPadding: EdgeInsets.symmetric(vertical: screenHeight * CommonPadding.basic), // Adjust the vertical padding → Container 에는  height 안먹힘
          )
      )
    );
  }
}



