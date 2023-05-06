// import 'package:climing/user_info.dart';
// import 'package:flutter/material.dart';
// import 'ranking.dart';
// import 'home.dart';
//
// class Main extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'climing',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//       ),
//       home: MyHomePage(title: '클라이밍'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({required this.title});
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _children = [Home(), Rangking(), UserInfo()];
//   void _onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _children[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             onTap: _onTap,
//             currentIndex: _currentIndex,
//             items: [
//               new BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: '',
//               ),
//               new BottomNavigationBarItem(
//                 icon: Icon(Icons.sports_score_rounded),
//                 label: '',
//               ),
//               new BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: '',
//               )
//             ]));
//   }
// }
