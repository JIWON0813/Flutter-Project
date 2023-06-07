import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final String message;
  final double itemSize;

  const HomeItem({required this.color, required this.borderRadius, required this.message, required this.itemSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemSize,
      height: itemSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          message,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      )
    );
  }
}