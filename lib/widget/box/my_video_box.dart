import 'package:flutter/material.dart';

// MyVideo 페이지에서 하나의 동영상 등록 정보 상자를 정의함
// 동영상 여러개 등록한 경우 본 위젯을 여러번 재사용
class MyVideoBox extends StatelessWidget{
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
  final double width; // 가로 사이즈 기본값
  final double height; // 세로 사이즈 기본값

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
    this.width = 280,
    this.height = 80,
  }):super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(
        top: 0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      width: this.width,
      height: this.height,
      //color: Color.fromARGB(255, 252, 249, 81), // TODO 제거 예정. 내부 요소 레이아웃 확인하기 위해 임시로 색상 적용함.
      child: Row(
          children: [
            Container( // 동영상 섬네일.
                height: 70, width: 70,
                color: Colors.purple,
                margin: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                  left: 5.0,
                  right: 5.0,
                ),
            ),
            Container( // 동영상 관련 상세 정보 상자 → 날짜 제목 등
              height: 70, width: 195,
              margin: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
                right: 5.0,
              ),
              padding:EdgeInsets.only(
                top: 3.0,
                bottom: 3.0,
                left: 3.0,
                right: 3.0,
              ),
              child:
                Column( // 수직으로 3개 part : 1.날짜 및 시간, 2. 포스팅 타이틀, 3.레벨 유형 좋아요 개수 등
                  children: [
                    Container( // 1.날짜, 시간, 성공여부
                      height: 15,
                      child: Row(
                        children: [
                          Container( // 날짜
                            width: 110,
                            child:
                            Row(
                                children: [
                                  Container(
                                    child:Column(
                                        children: [
                                          Text( // 날짜
                                              '${this.date.substring(0,4)}년 ${this.date.substring(4,6)}월 ${this.date.substring(6,8)}일',
                                              style: TextStyle(fontSize: 9, color: Color(0xff9E9E9E)))
                                        ]
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Container( // 시간, 성공여부
                            child:
                            Row(
                                children: [
                                  Container(
                                    child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text( // 시간. 숫자만 사용하는 경우 문자열 사용한 경우와 정렬이 틀어져서 toString으로 문자 변환
                                            '${this.time.substring(0,2)}:${this.time.substring(2,4)}',
                                            style: TextStyle(fontSize: 9, color: Color(0xff9E9E9E)),
                                            textAlign: TextAlign.center,)
                                        ]
                                    ),
                                  ),
                                  Container( // 성공여부
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                      left: 7.0,
                                    ),
                                    padding:EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: this.success == true ? Colors.pink : Colors.black26, // TODO 임시 색상, 변경 가능. 성공시 핑크색 실패시 회색
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child:
                                    Text(
                                        '${this.success ? '성공' : this.completeRatio.toString() + '%'}', // 실패인 경우는 completeRatio 보여줌
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 9, color: Colors.white)
                                    ),
                                  ),
                                ]
                            ),
                          ),
                         ],
                      ),
                    ),
                    Container( // 2. 포스팅 타이틀,
                      height: 20,
                      child: Row(
                        children: [
                            Text(
                              this.title
                              , style: TextStyle(fontSize: 12, color: Colors.black)
                            )
                          ],
                      ),
                    ), // 2. 포스팅 타이틀
                    Container( // 3.레벨 유형 좋아요 개수 등
                      height: 25, //color: Color.fromARGB(255, 200, 123, 10),
                      child:
                        Row(
                          children: [
                            Container( // 댓글 및 좋아요
                                width: 120,
                                child:
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          right: 7.0,
                                        ),
                                        padding:EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 245, 245, 245),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        child: Text(
                                            '${this.level}레벨',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 9, color: Color(0xff9E9E9E))),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          right: 7.0,
                                        ),
                                        padding:EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 245, 245, 245),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        child:
                                        Text(
                                            '${this.type}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 9, color: Color(0xff9E9E9E))
                                        ),
                                      ),
                                    ]
                                )
                            ),
                            Container( // 댓글 및 좋아요
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 5.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.message_outlined, size: 13.0),
                                        Padding(padding: EdgeInsets.only(left: 2)),
                                        Text('${this.replyCnt}', style: TextStyle(fontSize: 11, color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.star_border_outlined, size: 13.0),
                                        Padding(padding: EdgeInsets.only(left: 2)),
                                        Text('${this.likeCnt}', style: TextStyle(fontSize: 11, color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                    ), // 3.레벨 유형 좋아요 개수 등
                  ],
                ),
            ),
          ]
      ),
    );
  }
}