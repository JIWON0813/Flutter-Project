import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter/foundation.dart';

class OAuth {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String url = 'http//127.0.0.1:8080';

  static Future<Map<String, dynamic>> loginWithKakao() async{
    // 카카오톡 로그인 기능 호출
    bool isInstalled = await isKakaoTalkInstalled();
    var web = kIsWeb;
    try{
      OAuthToken token = isInstalled? await UserApi.instance.loginWithKakaoTalk() : await UserApi.instance.loginWithKakaoAccount();
      var response = await http.get(Uri.parse('$url/login/oauth/kakao'), headers: <String, String> { 'token' : token.accessToken });
      var result = jsonDecode(response.body);
      return result;
    }
    catch(error){
      return Future.error(error);
    }
    

    

    
  }
}