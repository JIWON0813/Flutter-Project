import 'dart:convert';
import 'package:climing/join/profile_set.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../User/User.dart';
import '../login/login.dart';

// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)

// 화면구분 : 회원가입 첫 페이지
// 주요내용 : 이메일, 비밀번호 입력
class JoinStart extends StatelessWidget {

  String email = '';
  String password = '';

  void _joinWithKakao() {
  }
  void _joinWithInsta() {
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox( // header
                width: 300.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('반가워요!', style: TextStyle(fontSize: 24, color: Colors.black)),
                      Text('처음 오셨나 보네요.\n회원가입 후에 모든 기능을 이용하실 수 있어요.', style: TextStyle(fontSize: 15, color: Color(0xff9E9E9E)))]
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: TextFormField(
                  autofocus: true,
                  onChanged: (value){
                    email = value as String;
                    print(value);
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator:(value){
                  },
                  decoration:
                    InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                      hintText: '이메일',
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.always,
                  validator:(value){ // 유효성검사
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    hintText: '비밀번호',
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: TextFormField(
                  obscureText: true,
                  onChanged: (value){
                    password = value as String;
                    print(value);
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator:(value){ // 유효성검사
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    hintText: '비밀번호 확인',
                  ),
                ),
              ),
              // GestureDetectorx button event
              SizedBox(
                width: 300.0,
                height: 55.0,
                child:
                TextButton(
                  child: const Text('다음', textAlign: TextAlign.center, style: TextStyle(fontSize: 15,color: Colors.white)),
                  onPressed:  () async{
                    var user = User(email,password);
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>ProfileSet(user:user)),
                      );
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFF4AA1),
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('또는', textAlign: TextAlign.center, style: TextStyle(fontSize: 15))]
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 55.0,
                child:
                OutlinedButton.icon(
                  label: Text('카카오톡으로 가입하기', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Color(0xff5A5A5A), fontWeight:FontWeight.bold)),
                  //onPressed: () {},
                  onPressed: _joinWithKakao,
                  icon: Icon(Icons.star, size: 30), // 추후 카카오 아이콘으로 변경 예정
                  style: OutlinedButton.styleFrom( // border
                    side: BorderSide(color :Color(0xffFF4AA1)),
                ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 300.0,
                height: 55.0,
                child:
                OutlinedButton.icon(
                  label: Text('인스타그램으로 가입하기', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Color(0xff5A5A5A),fontWeight:FontWeight.bold)),
                  //onPressed: () {},
                  onPressed: _joinWithInsta,
                  icon: Icon(Icons.star, size: 30), // 추후 인스타 아이콘으로 변경 예정
                  style: OutlinedButton.styleFrom( // border
                    side: BorderSide(color :Color(0xffFF4AA1)),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 300.0,
                height: 55.0,

                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('이미 계정이 있나요? ', style: TextStyle(fontSize: 15, color: Color(0xff5A5A5A),fontWeight:FontWeight.bold)),
                  Text('로그인하기', style: TextStyle(fontSize: 15, color: Color(0xffFF4AA1),fontWeight:FontWeight.bold))], // 색상 바꾸기. TODO 버튼으로 바꾸기
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}









// Widget imageProfile(BuildContext context){
//   return Center(
//     child: Stack(
//       children: <Widget>[
//         CircleAvatar(
//           radius: 80,
//           backgroundImage: _imageFile == null ? AssetImage('assets/profile.jfif') : FileImage(File(_imageFile.path)),
//         ),
//         Positioned(
//             bottom: 20,
//             right: 20,
//             child: InkWell(
//                 onTap: (){
//                   showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()));
//                 },
//               child: Icon(
//                 Icons.camera_alt,
//                 //color: secondaryTextColor,
//                 size: 40,
//               ),
//             )
//         )
//       ],
//     ),
//   );
// }
//
// Widget bottomSheet(BuildContext context){
//   return Center(
//
//   );
// }



