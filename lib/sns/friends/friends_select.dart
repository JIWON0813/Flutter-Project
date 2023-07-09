import 'package:flutter/material.dart';

class FriendsSelect {
  static void showCustomDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              Text('asdasd'),
            ],
          ),
          content: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 첫 번째 버튼 동작 처리
                        },
                        child: Text('버튼 1'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // 두 번째 버튼 동작 처리
                        },
                        child: Text('버튼 2'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // 팝업에서 수행할 동작을 처리합니다.
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }
}
