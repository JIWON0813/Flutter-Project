import 'package:flutter/material.dart';

import 'layout.dart';
// TODO 배경 색상 제거 예정. 개발시 내부 요소 레이아웃 확인하기 위해 임시로 색상 적용함.

// 전체 화면을 header body footer로 분할하여 각 내부 요소를 배치하는데 사용하는 레이아웃용 위젯
// header (화면 상단부 위젯) : 현재 화면의 타이틀과 그에 대한 상세 내용을 보여줌 (ex title:내영상, detail : 내가 올린 영상을 확인해보세요), 미사용시 body로 크기 흡수
// body (화면 중앙부 위젯) : 내용
// footer (화면 하단부 위젯) : 하단 nav bar, 미사용시 body로 크기 흡수 (ex 회원가입 화면에서는  footer(하단 nav bar 아이콘 버튼)가 없기 때문에, footer 위젯 미사용. footer 크기만큼 body 사용)

// header, body, footer와 함께 크기 조절 필요함. → 전체 합 일치하도록

class Header extends StatelessWidget{
  final String menuTitle; // 현재 화면의 타이틀
  final String menuDetail; // 타이틀 관련 상세 내용
  final IconData? icon; // 혹시 헤더에 아이콘 쓰인다면 사용할 것
  final double x; //기기화면 전체 가로 길이 대비 만들고 싶은 가로 길이 비율 ex) 1 → 가로 꽉 채우는 경우
  final double y; //기화면 전체 높이 길이 대비 만들고 싶은 높이 길이 비율 ex) 0.8

  Header({
    Key? key,
    this.menuTitle = "기본 타이틀", // 현재 화면의 타이틀
    this.menuDetail = "상세 설명", // 타이틀 관련 상세 내용
    this.icon, // 혹시 사용될 아이콘
    this.x = 1, // 가로 요청 비율 안넘어오는 경우 기본값
    this.y = 1  // 세로 요청 비율 안넘어오는 경우 기본값
  }):super(key:key);

  @override
  Widget build(BuildContext context){

    List<Widget> child = [
      Padding(padding: EdgeInsets.only(top: 15)),
      Text(this.menuTitle, style: TextStyle(fontSize: 24, color: Colors.black)),// 현재 화면의 타이틀
      Padding(padding: EdgeInsets.only(top: 10)),
      Text(this.menuDetail, style: TextStyle(fontSize: 16, color: Color(0xff9E9E9E)))// 타이틀 관련 상세 내용
    ];

    return Container(
      child:  LayoutWidget(
        y: y, // ex) 0.8 실제 기기 세로 길이의 80%로 만들어서 반환함
        pl : 0.07, // 피그마 기준 오른쪽 패딩 1/2
        pr: 0.07, // 피그마 기준 오른쪽 패딩 1/20
        pt: 0.05, // 피그마 기준 오른쪽 패딩 1/20
        crossAxisAlignment : CrossAxisAlignment.start, // left
        innerChild: child,
        color: Colors.black12, // TODO 구조 임시 확인용 (제거 예정)
      )
    );
  }
}