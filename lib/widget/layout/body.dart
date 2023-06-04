import 'package:flutter/material.dart';
// TODO 배경 색상 제거 예정. 개발시 내부 요소 레이아웃 확인하기 위해 임시로 색상 적용함.

// 전체 화면을 header body footer로 분할하여 각 내부 요소를 배치하는데 사용하는 레이아웃용 위젯
// header (화면 상단부 위젯) : 현재 화면의 타이틀과 그에 대한 상세 내용을 보여줌 (ex title:내영상, detail : 내가 올린 영상을 확인해보세요), 미사용시 body로 크기 흡수
// body (화면 중앙부 위젯) : 내용
// footer (화면 하단부 위젯) : 하단 nav bar, 미사용시 body로 크기 흡수 (ex 회원가입 화면에서는  footer(하단 nav bar 아이콘 버튼)가 없기 때문에, footer 위젯 미사용. footer 크기만큼 body 사용)

// 위젯 높이는 임시로 설정되었으며, 추후 모바일 사이즈 등 유동적으로 변경될 시에
// header, body, footer와 함께 크기 조절 필요함. → 전체 합 일치하도록

class Body extends StatelessWidget{
  final double width; // 가로 사이즈 기본값
  final double height; // 세로 사이즈 기본값
  final List<Widget> child; // body에 사용될 children list

  Body({
    Key? key,
    this.width = 300,
    this.height = 550,
    required this.child
  }):super(key:key);

  @override
  Widget build(BuildContext context){
    return Container( // header
      width: this.width,
      height: this.height,
      color: Color.fromARGB(100, 100, 100, 100), // TODO 제거 예정. 내부 요소 레이아웃 확인하기 위해 임시로 색상 적용함.
      child: Column(
          crossAxisAlignment : CrossAxisAlignment.start, // left
          children: this.child
      ),
    );
  }
}