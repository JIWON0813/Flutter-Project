import 'package:flutter/material.dart';
import '../../style/common_style.dart';

// OutlinedButton 사용한 공통 버튼용 위젯
// 버튼 내부 배경색상 없고 겉에 테두리만 존재함
class LineButton extends StatelessWidget{
  final String label; // 버튼 내에 사용할 문자
  final double fontSize; // 버튼 내에 사용할 문자의 크기
  final Color textColor; // 버튼 내에 사용할 문자의 색상
  final TextAlign textAlign; // 버튼 내에 사용할 문자 위치
  final IconData icon; // 버튼에 사용할 아이콘 (필수 사용  X)
  final Color backgroundColor; // 버튼 색상
  final Color borderColor; // 버튼 테두리 색상
  final VoidCallback callback; // 버튼 클릭시 실행할 메서드
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

  LineButton({
    Key? key,
    this.label = "기본버튼", // 버튼 내부 문자열 필수
    this.fontSize = 15,
    this.textColor = CommonColor.grey300,
    this.textAlign = TextAlign.center,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.x = 1, // 가로 요청 비율 안넘어오는 경우 기본값
    this.y = 0.07,  // 세로 요청 비율 안넘어오는 경우 기본값
    this.pl = 0,
    this.pr = 0,
    this.pt = 0,
    this.pb = 0,
    this.ml = 0,
    this.mr = 0,
    this.mt = 0.012,
    this.mb = 0.012,
    required this.callback
  }):super(key:key);


  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width; // 기기 전체 가로 길이 → 매번 호출하지 않고, 한 파일에서 관리해도 될듯
    final screenHeight = MediaQuery.of(context).size.height; // 기기 전체 세로 길이  → 매번 호출하지 않고, 한 파일에서 관리해도 될듯

    return Container(
      height: screenHeight * y,
      width: double.infinity, // Occupy full width 버튼 가로길이 현재 가능 영역에서 꽉차게 그리기
      margin: EdgeInsets.only(
        top: screenHeight * this.mt,
        bottom: screenHeight * this.mb,
        left: 0,
        right: 0,
        ),
      child:
        OutlinedButton.icon(
          // TODO 폰트 사이즈 기기에 맞도록 스타일 디렉토리에 공통 dart 생성해서 관리하고 사용해야함.
          label: Text(this.label, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: this.textColor, fontWeight:FontWeight.bold)),
          onPressed: (){
          this.callback();
          },
          icon: Icon(this.icon, size: 30), // TODO 아이콘 사이즈도 기기에 맞게 %로 받도록 수정해야함
          style: OutlinedButton.styleFrom( // border
          side: BorderSide(color :CommonColor.main),
          ),
       ),
    );
  }
}



