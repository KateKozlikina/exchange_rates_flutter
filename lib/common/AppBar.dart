import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  MyAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: new Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
