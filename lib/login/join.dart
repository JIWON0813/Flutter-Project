import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

// main color : Color(0xffFF4AA1)
// 진한 회식 Color(0xff5A5A5A)

// 사용자 기본 정보 객체 확정되면 다른 폴더에 만들 예정
class User{
  String email; // 로그인 객체 key
  String password; // 비번 필수
  String? id; // 계정 아이디
  User(this.email, this.password);
}




// 회원가입 1페이지
// 이메일, 비밀번호 입력
class Join1 extends StatelessWidget {

  // 1페이지 form 입력값 저장
  String _email = '';
  String _password = '';

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
                child: TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                  autofocus: true,
                  onChanged: (value){
                    _email = value as String;
                    print(value);
                  },
                  autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                  validator:(value){ // 유효성검사
                  },
                  decoration: // 스타일 설정
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
                  autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
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
                    _password = value as String;
                    print(value);
                  },
                  autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
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
                    var user = User(_email,_password);
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Join2(user:user)),
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



// 회원가입 2페이지
// 아이디 입력
class Join2 extends StatelessWidget {
  User user;

  Join2({required this.user});
  // 다음 버튼 클릭시 페이지 이동 & 파라미터 전달

  void _joinWithKakao() {
  }

  void _joinWithInsta() {
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 4;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // left
            children: [
              SizedBox( // header
                width: 300.0,
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('계정설정', style: TextStyle(fontSize: 24, color: Colors.black)),
                      Text('계정을 설정합니다', style: TextStyle(fontSize: 15, color: Color(0xff9E9E9E)))]
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 90.0,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('아이디' ,style: TextStyle(fontSize: 18, color: Colors.black)),
                      TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                        autofocus: true,
                        onChanged: (value){
                          user.id = value as String; // 아이디 할당
                          print(value);
                        },
                        autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                          validator:(value){ },
                      decoration: // 스타일 설정
                        InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_rounded),
                          border: OutlineInputBorder(),
                          hintText: '아이디',
                        ),
                      )
                  ]
                ),
              ),

              SizedBox(
                width: 300.0,
                height: 300.0,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('프로필사진' ,style: TextStyle(fontSize: 18, color: Colors.black)),
                      Container(
                        constraints: BoxConstraints(
                          minHeight: imageSize,
                          minWidth: imageSize,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.account_circle_rounded,
                            size: imageSize,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(
                  width: 300.0,
                  height: 55.0,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('지금은건너뛰기', style: TextStyle(decoration: TextDecoration.underline,fontSize: 15, color: Colors.grey,fontWeight:FontWeight.bold)), // 색상 바꾸기. TODO 버튼으로 바꾸기
                        onPressed:  () async{
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Join3(user:user)),
                          );
                        },
                      ),
                    ]
                    ),
                  ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 300.0,
                height: 55.0,
                child:
                TextButton(
                  child: const Text('다음', textAlign: TextAlign.center, style: TextStyle(fontSize: 15,color: Colors.white)),
                  onPressed:  () async{
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Join3(user:user)),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFF4AA1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// 회원가입 2페이지
// 아이디 입력
class Join3 extends StatelessWidget {
  User user;
  Join3({required this.user});
  // 다음 버튼 클릭시 페이지 이동 & 파라미터 전달

  // 회원가입 임시 요청
  static _requestJoin() async{
    print('this1');
    Map data = { 'email' : 'miso100422@threecount.com', 'name' : 'mimip', 'password':'test' };
    var body = json.encode(data);

    try{
      var response = await http.post(Uri.parse('http://localhost:8080/api/user/join'),  headers: {"Content-Type": "application/json"}, body:body);
      print('this2');
      var result = jsonDecode(response.body);
      print(result);
      return result;
    }
    catch(error){
      return Future.error(error);
    }

  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 4;

    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // left
              children: [
                SizedBox( // header
                  width: 300.0,
                  height: 80,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // left
                      children: [
                        Text('더 자세한 정보', style: TextStyle(fontSize: 24, color: Colors.black)),
                        Text('아이디(할당필요) 님에 대해서 좀 더 알려 주세요!', style: TextStyle(fontSize: 15, color: Color(0xff9E9E9E)))] // 아이디 가져오기
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 70.0,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 250,
                          child:
                            TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                              onChanged: (value){
                              },
                              autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                              validator:(value){ // 유효성검사
                              },
                              decoration: // 스타일 설정
                              InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '키',
                              ),
                            ),
                        ),
                      SizedBox(
                          width: 50,
                          child:
                          Text('cm', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
                    ]
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 70.0,
                  child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child:
                          TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                            onChanged: (value){
                            },
                            autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                            validator:(value){ // 유효성검사
                            },
                            decoration: // 스타일 설정
                            InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '몸무게',
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 50,
                            child:
                            Text('kg', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
                      ]
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 90.0,
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start, // left
                      children: [
                        Text('클라이밍 경력' ,style: TextStyle(fontSize: 18, color: Colors.black)),
                        TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                          onChanged: (value){
                            user.id = value as String; // 아이디 할당
                            print(value);
                          },
                          autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                          validator:(value){ },
                          decoration: // 스타일 설정
                          InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(ex: 3회, 6개월, 2년 등)',
                          ),
                        )
                      ]
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 90.0,
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start, // left
                      children: [
                        Text('주로 활동하는 지역' ,style: TextStyle(fontSize: 18, color: Colors.black)),
                        TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
                          onChanged: (value){
                            user.id = value as String; // 아이디 할당
                            print(value);
                          },
                          autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
                          validator:(value){ },
                          decoration: // 스타일 설정
                          InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '드롭다운찾아보고 있음',
                          ),
                        )
                      ]
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 55.0,
                  child:
                  TextButton(
                    child: const Text('입력완료', textAlign: TextAlign.center, style: TextStyle(fontSize: 15,color: Colors.white)),
                    onPressed:  () async{
                      _requestJoin();
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Join4(user:user)),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffFF4AA1),
                    ),
                  ),
                ),
      ],
    ),
    ),
    ),
    );
  }


// 회원가입 완료 페이지
class Join4 extends StatelessWidget {
  User user;
  Join4({required this.user});

  // 다음 버튼 클릭시 페이지 이동 & 파라미터 전달

  // 회원가입 임시 요청
  static _requestJoin() async {
    print('this1');
    Map data = {
      'email': 'miso100422@threecount.com',
      'name': 'mimip',
      'password': 'test'
    };
    var body = json.encode(data);

    try {
      var response = await http.post(
          Uri.parse('http://localhost:8080/api/user/join'),
          headers: {"Content-Type": "application/json"}, body: body);
      print('this2');
      var result = jsonDecode(response.body);
      print(result);
      return result;
    }
    catch (error) {
      return Future.error(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery
        .of(context)
        .size
        .width / 4;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // left
            children: [
              SizedBox( // header
                width: 300.0,
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('계정 생성 완료',
                          style: TextStyle(fontSize: 24, color: Colors.black)),
                    ] // 아이디 가져오기
                ),
              ),

              SizedBox(
                width: 300.0,
                height: 300.0,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: imageSize,
                          minWidth: imageSize,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.account_circle_rounded,
                            size: imageSize,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text('아뒤 땡떙' ,style: TextStyle(fontSize: 18, color: Colors.black)),
                    ]
                ),
              ),
              SizedBox( // header
                width: 300.0,
                height: 80,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // left
                    children: [
                      Text('클비에 오신 걸 환영해요!', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
                      Text('지금부터 모든 기능을', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
                      Text('이용하실 수 있어요.', style : TextStyle(fontSize: 15, color: Color(0xff9E9E9E))),
                    ] // 아이디 가져오기
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 55.0,
                child:
                TextButton(
                  child: const Text('시작!', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Login()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFF4AA1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
