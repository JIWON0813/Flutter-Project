import 'dart:ui';

// 메인색상 등 공통 컬러 관리용 파일
// → 추후 메인 색상 변경되면 한번에 전부 변경
class CommonColor {
  static const Color main = const Color(0xff0F854D); // 현재 메인 색상 (녹색)
  static const Color grey100 = const Color(0xffF5F5F5); // 현재 메인 색상 (연회색)
  static const Color grey200 = const Color(0xff9E9E9E); // 현재 메인 색상 (회색)
  static const Color grey300 = const Color(0xff5A5A5A); // 현재 메인 색상 (짙은회색)
}

// 기본 비율
class CommonMargin {
  static const double basic = 0.012;
}

// 기본 비율
class CommonPadding {
  static const double basic = 0.012;
}

// // 테두리 설정 (폰트 굵기 X)
class CommonBorder {
static const double basic = 6; // BorderRadius.circular(6)
         //borderSide: BorderSide.none, // Remove the default border
}


