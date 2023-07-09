import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../style/common_style.dart';

// 이메일, 아이디 등 텍스트 입력하는 input 상자 생성용 위젯

class TextLinedInput extends StatelessWidget{
  final String hintText; // input 상자 내부 placeholder
  final double fontSize; // 버튼 내에 사용할 문자의 크기
  final Color textColor; // 버튼 내에 사용할 문자의 색상
  final TextAlign textAlign; // 버튼 내에 사용할 문자 위치
  final IconData? icon; // 버튼에 사용할 아이콘 (필수 사용  X)
  final Color backgroundColor; // 버튼 색상
  final Color borderColor; // 버튼 테두리 색상
  final VoidCallback callback; // 버튼 클릭시 실행할 메서드
  final double x; //기기화면 전체 가로 길이 대비 만들고 싶은 가로 길이 비율 ex) 1 → 가로 꽉 채우는 경우
  final double y; //기화면 전체 높이 길이 대비 만들고 싶은 높이 길이 비율 ex) 0.8
  final double pl; // 기기화면 전체 가로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0.05 → 전체 길이 * 0.05 사용해서 실제 왼쪽 패딩 추출
  final double pr; // 기기화면 전체 가로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0 → 전체 길이 * 0 사용해서 실제 오른쪽 패딩 0으로 적용
  final double pt; // 기기화면 전체 세로길이 대비 만들고 싶은 내부 패딩 비율
  final double pb; // 기기화면 전체 세로길이 대비 만들고 싶은 내부 패딩 비율
  final double ml; // 기기화면 전체 가로길이 대비 만들고 싶은 왼쪽 마진 패딩 비율
  final double mr; // 기기화면 전체 가로길이 대비 만들고 싶은 오른쪽 마진 비율
  final double mt; // 기기화면 전체 세로길이 대비 만들고 싶은 위쪽 마진 비율
  final double mb; // 기기화면 전체 세로길이 대비 만들고 싶은 아래쪽 마진 비율
  final bool autoFocus;
  final bool obscureText;
  final List<TextInputFormatter>? textInputFormatter; // 텍스트 유효성 검사용


  TextLinedInput({
    Key? key,
    this.hintText = "placeholder", // input 상자 내부 placeholder
    this.fontSize = 15,
    this.textColor = CommonColor.grey300,
    this.textAlign = TextAlign.center,
    this.icon,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    required this.callback,
    this.textInputFormatter,
    this.x = 1, // 가로 요청 비율 안넘어오는 경우 기본값
    this.y = 0.07,  // 세로 요청 비율 안넘어오는 경우 기본값
    this.pl = 0,
    this.pr = 0,
    this.pt = 0,
    this.pb = 0,
    this.ml = 0,
    this.mr = 0,
    this.mt = 0.012,
    this.mb = 0.012,
    this.autoFocus = false,
    this.obscureText = false
  }):super(key:key);


  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이  → 매번 호출하지 않고, 한 파일에서 관리해도 될듯

    return Container(
      width: double.infinity, // Occupy full width 버튼 가로길이 현재 가능 영역에서 꽉차게 그리기
      margin: EdgeInsets.only(
        top: ScreenSize.height * this.mt,
        bottom: ScreenSize.height * this.mb,
        left: 0,
        right: 0,
      ),
      child:
      TextFormField(
        autofocus: this.autoFocus,
        obscureText: this.obscureText,
        onChanged: (value){
        // email = value as String;
          // TODO print(value); 각각의 input 상자 고유 키값(name) 가지고 value 할당하도록 수정 필요
        },
        autovalidateMode: AutovalidateMode.always,
        validator:(value){
        },
        decoration:
          InputDecoration(
            prefixIcon: this.icon != null ? Icon(this.icon, size: 30) : null ,// TODO 사이즈도 비율에 따라서 변경 필요함
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(CommonBorder.br6), //8
              borderSide: BorderSide.none, // Remove the default border
            ),
            hintText: this.hintText,
            filled: true,
            fillColor: CommonColor.grey100, // Set the desired background color,
            // 왜 나눴는지 궁금하면 ?
            contentPadding: EdgeInsets.symmetric(vertical: screenHeight * y/2.5), // Adjust the vertical padding → Container 에는  height 안먹힘
          )
      )
    );
  }
}



