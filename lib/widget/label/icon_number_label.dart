import 'package:climing/style/common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// 아이콘과 숫자가 혼합되어있는 라벨입니다.
// 메뉴 위치 예시 : 내 영상 포스팅 하기 → ex) 댓글아이콘+댓글개수, 좋아요아이콘+좋아요개수 등
class IconNumberLabel extends StatefulWidget {
  final IconData icon; // 라벨 들어갈 라벨 타이틀
  final double cnt ; // 라벨 들어갈 라벨 타이틀
  const IconNumberLabel({Key? key,
    required this.icon,
    required this.cnt
  }) : super(key: key);

  @override
  _IconNumberLabel createState() => _IconNumberLabel();
}

class _IconNumberLabel extends State<IconNumberLabel> {

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(
        right: 5.0,
      ),
      child: Row(
        children: [
          Icon(widget.icon, size: 13.0),
          Padding(padding: EdgeInsets.only(left: 2)),
          Text('${widget.cnt}', style: TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}



