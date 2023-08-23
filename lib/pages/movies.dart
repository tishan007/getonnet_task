import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/movie_list_controller.dart';
import 'app_list.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
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
