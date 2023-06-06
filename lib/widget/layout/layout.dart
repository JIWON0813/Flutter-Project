import 'package:flutter/material.dart';
// 화면 비율 조정용 위젯
// 반환 = '기기화면 * 요청비율'로 만든 Container
// PercentageSizedWidget 참고하여 작성함

class LayoutWidget extends StatelessWidget {
  final double x; //기기화면 전체 가로 길이 대비 만들고 싶은 가로 길이 비율 ex) 1 → 가로 꽉 채우는 경우
  final double y; //기화면 전체 높이 길이 대비 만들고 싶은 높이 길이 비율 ex) 0.8
  final List<Widget> innerChild; // 내부 children
  final Color color; // TODO : DIV 확인용 → 얼만큼 사이즈 잡혔는지 확인 (추후 제거)
  final CrossAxisAlignment crossAxisAlignment; // left

  final double pl; // 기기화면 전체 가로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0.05 → 전체 길이 * 0.05 사용해서 실제 왼쪽 패딩 추출
  final double pr; // 기기화면 전체 가로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0 → 전체 길이 * 0 사용해서 실제 오른쪽 패딩 0으로 적용
  final double pt; // 기기화면 전체 세로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0.05 → 전체 길이 * 0.05 사용해서 실제 위쪽 패딩 추출
  final double pb; // 기기화면 전체 세로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0.05 → 전체 길이 * 0.05 사용해서 실제 아래쪽 패딩 추출

  LayoutWidget({
    this.x = 1,
    this.y = 1,
    required this.innerChild,
    this.color= Colors.red,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.pl = 0,
    this.pr = 0,
    this.pt = 0,
    this.pb = 0
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // 기기 전체 가로 길이 → 매번 호출하지 않고, 한 파일에서 관리해도 될듯
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이  → 매번 호출하지 않고, 한 파일에서 관리해도 될듯

    return Container(
      // 반환할 위젯의 높이 및 너비
      width: screenWidth * x,// 만들고 싶은 가로 길이 산출
      height: screenHeight * y,// 만들고 싶은 세로 길이 산출
      // padding
      padding:EdgeInsets.only( //
        top: screenHeight * this.pt,
        bottom: screenHeight * this.pb,
        left: screenWidth * this.pl,
        right: screenWidth * this.pr,
      ),
      color: this.color, // TODO : DIV 확인용 → 얼만큼 사이즈 잡혔는지 확인 (추후 제거)
      child: Column(
          crossAxisAlignment : this.crossAxisAlignment, // left
          children: this.innerChild
      ),
    );
  }
}