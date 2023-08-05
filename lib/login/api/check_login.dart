import 'dart:convert';
import 'package:climing/User/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CheckLogin {
  static const String centerUrl = 'https://jsonplaceholder.typicode.com';
  static const String url = 'http://127.0.0.1:8080';
  static const String loginPath ='/api/user/login';

  static Future<bool> login(User user) async{
    var web = kIsWeb;

    var body = json.encode(user);

    try{
      var req = url + loginPath;
      var res = await http.post(Uri.parse(req),
          headers: {"Content-Type": "application/json"}, body: body);
      if(res == null){
        return false;
      }
      return true;
    }
    catch(error){
      return Future.error(error);
    }

    return true;
  }
}