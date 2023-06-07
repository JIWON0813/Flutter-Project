import 'package:climing/sns/friends/friends_main.dart';
import 'package:climing/video/my_video.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'home/home.dart';
import 'login/loading.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'c6028d56198ef7a4ba5723297421e436', javaScriptAppKey: '62a2d2e6d0f684b246f14b2ec2d58fd6');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendsMain(), //SplashScreen(),
    );
  }
}
