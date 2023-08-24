import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getonnet_task/pages/app_list.dart';
import 'package:getonnet_task/pages/movie_page.dart';
import 'package:getonnet_task/pages/movies.dart';

import 'binding/all_controller_binding.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Get.put(MovieListController());
    Get.find<MovieListController>().getMovieListData();
    print("length main: ${Get.find<MovieListController>().movieList.value.genres.length}");

    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppList(),
        //body: MoviePage(),
        //body: Movies(),
      ),
    );
  }

}
