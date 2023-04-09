import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  final List<String> _titles = [
    'Profile',
    'Settings',
    'Privacy',
    'Notifications',
    'Help & Support',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              SizedBox(width: 16),
              CircleAvatar(
                radius: 50, // Change avatar size here
                backgroundImage: NetworkImage(
                  'https://fastly.picsum.photos/id/231/200/200.jpg?hmac=lUSm6Na5VxIhLKub6Y3JaBOAwCjkimAi-zHEOInwL58',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '클라이밍의 신 김지원',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Level 5',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _titles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_titles[index], style: TextStyle(fontSize: 25)),
                onTap: () {
                  // Handle item tap
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
// ListView(
// children: <Widget>[
// ListTile(
// title: Text('개인정보 변경'),
// onTap: (){
// Navigator.pushNamed(context, 'routeName');
// },
// ),
// ListTile(
// title: Text('알람'),
// onTap: (){
// Navigator.pushNamed(context, 'routeName');
// },
// ),
// ],
// );
