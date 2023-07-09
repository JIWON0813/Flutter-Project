import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// common_style
// 메인색상 등 공통 스타일 관리용 파일

// 기기 화면 사이즈
// MediaQuery.of(context).size; 사용 X
class ScreenSize {
  // WidgetsBinding runtime value → const 사용 불가, final사용
  static final double width = ui.window.physicalSize.width / ui.window.devicePixelRatio;
  static final double height =  ui.window.physicalSize.height / ui.window.devicePixelRatio;
}

// 폰트 사이즈 → 기기 사이즈에 맞게 재조정
class CommonFont{
  //static final double fontAdjustVal = (ui.window.physicalSize.width / ui.window.devicePixelRatio) /375.0;
  //static final double f12 = 12 * fontAdjustVal;
  //static final double f14 = 14 * fontAdjustVal;
  //static final double f16 = 16 * fontAdjustVal;
  //static final double f24 = 24 * fontAdjustVal;
static final double f12 = 12;
static final double f14 = 14;
static final double f16 = 16;
static final double f24 = 24;

}

// 공통 색상
class CommonColor {
  static const Color mainGreen = const Color(0xff0F854D); // 현재 메인 색상
  static const Color grey100 = const Color(0xffF5F5F5); // 현재 메인 색상
  static const Color grey200 = const Color(0xff9E9E9E); // 현재 메인 색상
  static const Color grey300 = const Color(0xff5A5A5A); // 현재 메인 색상
}

// 테두리 설정
class CommonBorder {
  static const double br6 = 6; // BorderRadius.circular(6) text input용 끝에만 살짝
  static const double br10 = 10; // BorderRadius.circular(10) image등 조금더 둥근 형태
}

