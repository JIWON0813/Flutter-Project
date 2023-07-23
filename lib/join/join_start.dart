import 'package:climing/join/profile_set.dart';
import 'package:climing/style/common_style.dart';
import 'package:climing/widget/button/line_button.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';
import '../User/user.dart';
import '../widget/button/main_button.dart';
import 'package:climing/widget/input/text_lined_input.dart';

class JoinStart extends StatefulWidget {
  @override
  _JoinStartState createState() => _JoinStartState();
}

// 화면구분 : 회원가입 첫 페이지
// 주요내용 : 이메일, 비밀번호 입력
class _JoinStartState extends State<JoinStart> {
  String email = '';
  String password = '';

  void _joinWithKakao() {
  }
  void _joinWithInsta() {
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // body에 들어갈 children list
    List<Widget> childWidgets = [
      TextLinedInput(
        autoFocus: true,
        callback : (){},
        icon: Icons.email,
        hintText: "이메일",
      ),
      TextLinedInput(
        autoFocus: true,
        callback : (){},
        icon: Icons.lock,
        hintText: "비밀번호",
        obscureText: true,
      ),
      TextLinedInput(
        autoFocus: true,
        callback : (){},
        icon: Icons.lock,
        hintText: "비밀번호 확인",
        obscureText: true,
      ),
      // GestureDetectorx button event
      MainButton(
        label:'다음',
        callback: () async{
          var user = User(email,password);
          final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>ProfileSet(user:user)),
          );
        },
      ),
      SizedBox(
        height: 60.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('또는', textAlign: TextAlign.center, style: TextStyle(fontSize: 16))]
        ),
      ),
      LineButton(
        label:'카카오톡으로 가입하기',
        callback: _joinWithKakao,
        icon: Icons.star_border_outlined,
      ),
      LineButton(
        label:'인스타그램으로 가입하기',
        callback: _joinWithInsta,
        icon: Icons.star_border_outlined,
      ),
      //TODO 여기 위치 조정해야함
      SizedBox(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('이미 계정이 있나요? ', style: TextStyle(fontSize: 15, color: Color(0xff5A5A5A),fontWeight:FontWeight.bold)),
          Text('로그인하기', style: TextStyle(fontSize: 15, color: CommonColor.main,fontWeight:FontWeight.bold))], // 색상 바꾸기. TODO 버튼으로 바꾸기
        )
      )
    ];


    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 회원가입 첫 페이지에는 Footer가 존재하지 않음.
              // Header 20, Body 80
              Header(
                  titleWidget: TitleWidget(title: '반가워요!'),
                  subTitleWidget: SubTitleWidget(subTitle: '처음 오셨나 보네요.\n회원가입 후에 모든 기능을 이용하실 수 있어요.'),
                  y: 0.2),
              Body(child: childWidgets, y: 0.8),
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



