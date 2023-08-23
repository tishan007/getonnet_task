import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/movie_list_controller.dart';
import 'app_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<MovieListController>().getMovieListData();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppList(),
      ),
    );
  }
}
