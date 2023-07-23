import 'package:climing/style/common_style.dart';
import 'package:flutter/material.dart';

import '../label/grey_Ellipse_label.dart';
import '../label/icon_number_label.dart';
import '../label/main_Ellipse_label.dart';

// MyVideo 페이지에서 하나의 동영상 등록 정보 상자를 정의함
// 동영상 여러개 등록한 경우 본 위젯을 여러번 재사용
class MyVideoBox extends StatefulWidget {
  // TODO DB 설계가 안나옴 → 하나의 포스팅에 댓글등이 있으므로 포스팅 식별 가능한 키 설정 후 프로퍼티 추가 필요함
  // 하나의 포스팅 BOX는 고유한 키 값을 가져야하며, 해당 키 값 기준으로 댓글, 좋아요 등 다른 테이블과 조인 가능하도록 key 필수 사용
  // final String TODO key블라블라
  // final String TODO 동영상 섬네일 어떻게 보여줄지 추가 필요함
  final String title; // 현재 화면의 타이틀
  final String date; // 날짜 문자열 ex) 2023년 01월 01일
  final String time; // 시간 문자열 ex) 16:29
  final bool success; // true값인 경우 화면에서 핑크색 성공 아이콘 보여줌
  final double completeRatio; // 성공률 (완성도) TODO DB 설계 나오고 프로퍼티 명 변경 예정
  final double level; // 레벨
  final String type; // 다이내믹, 밸런스, 파워, 지구력 등 유형
  final double replyCnt; // 댓글 개수
  final double likeCnt; // 좋아요 개수
  final double x; //기기화면 전체 가로 길이 대비 만들고 싶은 가로 길이 비율 ex) 1 → 가로 꽉 채우는 경우
  final double y; //기화면 전체 높이 길이 대비 만들고 싶은 높이 길이 비율 ex) 0.8

  MyVideoBox({
    Key? key,
    // TODO 기본 값 제거예정
    this.title = "포켓몬센터 강남점", // 현재 화면의 타이틀
    this.date = "20230101", // 타이틀 관련 상세 내용
    this.time = '1629',
    this.success = true, // TODO 기본값 제거 기본값 false 로 처리하고
    this.completeRatio = 0,
    this.level = 0,
    this.type = '피카츄',
    this.replyCnt = 0,
    this.likeCnt = 0,
    this.x = 1, // 가로 요청 비율 안넘어오는 경우 기본값
    this.y = 0.15, // 세로 요청 비율 안넘어오는 경우 기본값
  }) :super(key: key);

  @override
  _MyVideoBox createState() => _MyVideoBox();
}

class _MyVideoBox extends State<MyVideoBox> {
  @override
  Widget build(BuildContext context){

    return Container(
      height: MediaQuery.of(context).size.height * widget.y,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height  * 0.012,
        bottom: MediaQuery.of(context).size.height  * 0.012,
        left: 0,
        right: 0,
      ),
      //color: Color.fromARGB(255, 252, 249, 81), // TODO 제거 예정. 내부 요소 레이아웃 확인하기 위해 임시로 색상 적용함.
      child: Row(
          children: [

            AspectRatio( // 동영상 정사각형 섬네일 네모 TODO 이미지 DB에서 가져올 경우 보여줄 것
              aspectRatio: 1, // Set the aspect ratio to 1:1 for a square shape
              child: Container(
                color:  Colors.grey  // TODO 색상 사용하지 말고, 이미지로 가져올 것
              )
            ),

            Expanded(
              child:
              Container( // 동영상 섬네일 우측
                //width: double.infinity, // Occupy full width 현재 가능 영역에서 꽉차게 그리기
                color: Colors.white,
                child:
              Column( // 수직으로 3개 part : 1.날짜 및 시간, 2. 포스팅 타이틀, 3.레벨 유형 좋아요 개수 등
                children: [
                  Container(
                    child:
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween, // ROW 위젯 가로 간격 동일하게
                      children: [
                        Text( // 날짜
                            '${widget.date.substring(0,4)}년 ${widget.date.substring(4,6)}월 ${widget.date.substring(6,8)}일',
                            style: TextStyle(fontSize: 12, color: Color(0xff9E9E9E))),
                        Text( // 시간. 숫자만 사용하는 경우 문자열 사용한 경우와 정렬이 틀어져서 toString으로 문자 변환
                            '${widget.time.substring(0,2)}:${widget.time.substring(2,4)}',
                            style: TextStyle(fontSize: 12, color: Color(0xff9E9E9E)),
                            textAlign: TextAlign.center),
                        MainEllipseLabel( // 회색 타원형 라벨
                          title: '${widget.success ? '성공' : widget.completeRatio.toString() + '%'}',
                          success: widget.success,
                        ),
                      ],
                    ),
                  ),
                  Container( // 2. 포스팅 타이틀,
                    child: Row(
                      children: [
                        Text(
                            widget.title
                            , style: TextStyle(fontSize: 18, color: Colors.black)
                        )
                      ],
                    ),
                  ), // 2. 포스팅 타이틀
                  Container( // 3.레벨 유형 좋아요 개수 등
                    child:
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween, // ROW 위젯 가로 간격 동일하게
                      children: [
                        GreyEllipseLabel( // 회색 타원형 라벨
                          title: '${widget.level}레벨',
                        ),
                        GreyEllipseLabel(
                          title: widget.type, // 운동 유형 TODO DB 설계 후 네이밍 변경 예정
                        ),
                        IconNumberLabel( // 아이콘 및 숫자 라벨
                            icon : Icons.message_outlined,
                            cnt : widget.replyCnt
                        ),
                        IconNumberLabel(
                            icon : Icons.heart_broken,
                            cnt : widget.likeCnt
                        ),
                      ],
                    ),
                  ), // 3.레벨 유형 좋아요 개수 등
                ],
              ),
            ),
            )
          ]
      ),
    );
  }
}