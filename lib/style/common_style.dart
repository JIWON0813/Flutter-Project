import 'dart:ui';

// 메인색상 등 공통 컬러 관리용 파일
// → 추후 메인 색상 변경되면 한번에 전부 변경 가능함

class CommonColor {
  static const Color mainPink = const Color(0xffFF4AA1); // 현재 메인 색상
  static const Color grey100 = const Color(0xffF5F5F5); // 현재 메인 색상
  static const Color grey200 = const Color(0xff9E9E9E); // 현재 메인 색상
  static const Color grey300 = const Color(0xff5A5A5A); // 현재 메인 색상
}

// // 테두리 설정 (폰트 굵기 X)
class CommonBorder {
static const double basic = 6; // BorderRadius.circular(6)
         //borderSide: BorderSide.none, // Remove the default border
}
