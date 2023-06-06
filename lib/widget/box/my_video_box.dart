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
  final double x; //기기화면 전체 가로 길이 대비 만들고 싶은 가로 길이 비율 ex) 1 → 가로 꽉 채우는 경우
  final double y; //기화면 전체 높이 길이 대비 만들고 싶은 높이 길이 비율 ex) 0.8
  final double pl; // 기기화면 전체 가로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0.05 → 전체 길이 * 0.05 사용해서 실제 왼쪽 패딩 추출
  final double pr; // 기기화면 전체 가로길이 대비 만들고 싶은 내부 패딩 비율 ex) 값 0 → 전체 길이 * 0 사용해서 실제 오른쪽 패딩 0으로 적용
  final double pt; // 기기화면 전체 세로길이 대비 만들고 싶은 내부 패딩 비율
  final double pb; // 기기화면 전체 세로길이 대비 만들고 싶은 내부 패딩 비율
  final double ml; // 기기화면 전체 가로길이 대비 만들고 싶은 왼쪽 마진 패딩 비율
  final double mr; // 기기화면 전체 가로길이 대비 만들고 싶은 오른쪽 마진 비율
  final double mt; // 기기화면 전체 세로길이 대비 만들고 싶은 위쪽 마진 비율
  final double mb; // 기기화면 전체 세로길이 대비 만들고 싶은 아래쪽 마진 비율

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
    this.y = 0.15,  // 세로 요청 비율 안넘어오는 경우 기본값
    this.pl = 0,
    this.pr = 0,
    this.pt = 0,
    this.pb = 0,
    this.ml = 0,
    this.mr = 0,
    this.mt = 0.012,
    this.mb = 0.012,
  }):super(key:key);

  @override
  Widget build(BuildContext context){

    final screenWidth = MediaQuery.of(context).size.width; // 기기 전체 가로 길이 → 매번 호출하지 않고, 한 파일에서 관리해도 될듯
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이  → 매번 호출하지 않고, 한 파일에서 관리해도 될듯

    return Container(
      height: screenHeight * y,
      width: double.infinity, // Occupy full width 버튼 가로길이 현재 가능 영역에서 꽉차게 그리기
      color: Colors.red,
      margin: EdgeInsets.only(
        top: screenHeight * this.mt,
        bottom: screenHeight * this.mb,
        left: 0,
        right: 0,
      ),
      //color: Color.fromARGB(255, 252, 249, 81), // TODO 제거 예정. 내부 요소 레이아웃 확인하기 위해 임시로 색상 적용함.
      child: Row(
          children: [
            AspectRatio( // 동영상 섬네일  TODO 이미지 추후에 붙이기
              aspectRatio: 1, // Set the aspect ratio to 1:1 for a square shape
              child: Container(
                color: Colors.purple,
              )
            ),
            Container( // 동영상 섬네일 우측
              //width: double.infinity, // Occupy full width 현재 가능 영역에서 꽉차게 그리기
              height: 70,
              color: Colors.brown,
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