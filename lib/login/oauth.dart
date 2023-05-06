import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class OAuth {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<Map<String, dynamic>> loginWithKakao() async{
    // 카카오톡 로그인 기능 호출
    bool isInstalled = await isKakaoTalkInstalled();

    try{
      OAuthToken token = isInstalled? await UserApi.instance.loginWithKakaoTalk() : await UserApi.instance.loginWithKakaoAccount();
      var response = await http.get(Uri.parse('http://localhost:8080/login/oauth/kakao'), headers: <String, String> { 'token' : token.accessToken });
      var result = jsonDecode(response.body);
      return result;
    }
    catch(error){
      return Future.error(error);
    }
    

    

    
  }
}