import 'package:climing/sns/friends/friends_main.dart';
import 'package:climing/sns/message/message_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnsMain extends StatefulWidget {
  @override
  _SnsState createState() => _SnsState();
}

class _SnsState extends State<SnsMain> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "메세지"),
            Tab(text: "친구"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MessageMain(),
          FriendsMain(),
        ],
      ),
    );
  }
}