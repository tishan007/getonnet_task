import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getonnet_task/pages/app_list.dart';

import 'controller/movie_list_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    Get.put(MovieListController());
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppList(),
      ),
    );
  }

}
