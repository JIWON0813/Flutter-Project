import 'package:climing/rank_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rangking extends StatefulWidget {
  @override
  RangkingState createState() => RangkingState();
}

class RangkingState extends State<Rangking> {
  final List<Map<String, dynamic>> data = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Title 1',
      'body': 'Body 1',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Title 2',
      'body': 'Body 2',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Title 3',
      'body': 'Body 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(data[index])),
              );
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data[index]['image']),
                ),
                title: Text(data[index]['title']),
                subtitle: Text(data[index]['body']),
              ),
            ),
          );
        },
      ),
    );
  }
}