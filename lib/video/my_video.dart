import 'package:climing/widget/box/my_video_box.dart';
import 'package:climing/widget/layout/body.dart';
import 'package:climing/widget/layout/header.dart';
import 'package:flutter/material.dart';

// 화면구분 : 내 영상
// 주요내용 : 영상 업로드 및 삭제 등 영상 관리 기능
// 특징 : 영상이 있는 경우 등록된 영상 리스트 보여주기, 영상이 없는 경우 "아직 아무것도 업로드 하지 않았네요. 영상을 올려서 공유해 보세요!" 메시지 출력
// DB 설계 완료되고 동영상 리스트 가져오면, 반복문으로 MyVideoBox 사용할 수 있도록 수정 예정
class MyVideo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // body에 들어갈 children list
    List<Widget> childWidgets = [
      MyVideoBox(type:'파워', likeCnt: 130,),
      MyVideoBox(likeCnt: 135,),
      MyVideoBox(likeCnt: 170,),
      MyVideoBox(success: false,completeRatio: 80,)
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Header(menuTitle: '내 포스팅',menuDetail: '내가 올린 포스팅을 확인해 보세요'),
              Body(child: childWidgets),
              // SizedBox(
              //   width: 300.0,
              //   height: 70.0,
              //   child: Row(
              //       children: [
              //         SizedBox(
              //           width: 250,
              //           child:
              //           TextFormField(
              //             inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
              //             onChanged: (value){
              //             },
              //             autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
              //             validator:(value){ // 유효성검사
              //             },
              //             decoration: // 스타일 설정
              //             InputDecoration(
              //               border: OutlineInputBorder(),
              //               hintText: '키',
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //             width: 50,
              //             child:
              //             Text('cm', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
              //       ]
              //   ),
              // ),
              // SizedBox(
              //   width: 300.0,
              //   height: 70.0,
              //   child: Row(
              //       children: [
              //         SizedBox(
              //           width: 250,
              //           child:
              //           TextFormField(
              //             inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
              //             onChanged: (value){
              //             },
              //             autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
              //             validator:(value){ // 유효성검사
              //             },
              //             decoration: // 스타일 설정
              //             InputDecoration(
              //               border: OutlineInputBorder(),
              //               hintText: '몸무게',
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //             width: 50,
              //             child:
              //             Text('kg', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black))),
              //       ]
              //   ),
              // ),
              // SizedBox(
              //   width: 300.0,
              //   height: 90.0,
              //   child:
              //   Column(
              //       mainAxisAlignment: MainAxisAlignment.start, // left
              //       children: [
              //         Text('클라이밍 경력' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              //         TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
              //           onChanged: (value){
              //             user.id = value as String; // 아이디 할당
              //             print(value);
              //           },
              //           autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
              //           validator:(value){ },
              //           decoration: // 스타일 설정
              //           InputDecoration(
              //             border: OutlineInputBorder(),
              //             hintText: '(ex: 3회, 6개월, 2년 등)',
              //           ),
              //         )
              //       ]
              //   ),
              // ),
              // SizedBox(
              //   width: 300.0,
              //   height: 90.0,
              //   child:
              //   Column(
              //       mainAxisAlignment: MainAxisAlignment.start, // left
              //       children: [
              //         Text('주로 활동하는 지역' ,style: TextStyle(fontSize: 18, color: Colors.black)),
              //         TextFormField( // TextFormField는 TextField와 다르게 유효성 검사 가능
              //           onChanged: (value){
              //             user.id = value as String; // 아이디 할당
              //             print(value);
              //           },
              //           autovalidateMode: AutovalidateMode.always, // 사용자 입력시마다 validator() 진핸
              //           validator:(value){ },
              //           decoration: // 스타일 설정
              //           InputDecoration(
              //             border: OutlineInputBorder(),
              //             hintText: '드롭다운찾아보고 있음',
              //           ),
              //         )
              //       ]
              //   ),
              // ),
              // MainButton(
              //   label:'입력완료',
              //   callback: () async{
              //     _requestJoin();
              //     final result = await Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context)=>JoinComplete(user:user)),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}





