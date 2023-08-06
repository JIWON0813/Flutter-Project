import 'dart:convert';
import 'package:climing/User/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CheckLogin {
  static const String centerUrl = 'http://3.39.206.119:8080';
  static const String url = 'http://127.0.0.1:8080';
  static const String loginPath ='/api/user/login';

  static Future<bool> login(User user) async{
    var web = kIsWeb;

    var body = json.encode(user);

    try{
      var req = centerUrl + loginPath;
      var res = await http.post(Uri.parse(req),
          headers: {"Content-Type": "application/json"}, body: body);
      if(res.statusCode == 200 && res.body == "true"){
        return true;
      }
      return false;
    }
    catch(error){
      return Future.error(error);
    }

    return true;
  }
}