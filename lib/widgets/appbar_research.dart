import 'package:flutter/material.dart';

AppBar appbarResearch(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: Icon(
        Icons.menu,
      ),
      onTap: () {},
    ),
    title: Text('Research Centre'),
    backgroundColor: Colors.lightBlue[100],
    elevation: 0,
  );
}
