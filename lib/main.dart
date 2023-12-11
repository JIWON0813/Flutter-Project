 import 'package:climing/login/login.dart';
import 'package:climing/video/my_video.dart';
import 'package:climing/video/set_video_info.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'home/home.dart';
import 'join/join_start.dart';
import 'login/loading.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  // 플러터 내에서 firebase 사용하기 위해 비동기로 아래 메서드 호출 후
  // initialize()
  // Please enable Developer Mode in your system settings. 오류 발생시
  // 설정 > 개인정보 및 보안 > 개발자용 탭 on
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: '', javaScriptAppKey: '');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      //home: MyVideo(),
      //home: SetVideoInfo(),
      //home: Home(), //SplashScreen(),
    );
  }
}
