import 'package:flutter/material.dart';

class AppList extends StatefulWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Joy Volanath", style: TextStyle(color: Colors.black),));
  }
}
