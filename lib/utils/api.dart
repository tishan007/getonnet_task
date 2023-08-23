import 'dart:convert';

import 'package:getonnet_task/utils/remote_config.dart';
import 'package:http/http.dart' as http;

import '../models/movie_list.dart';

class Api {
  String baseUrl = RemoteConfig.config["BASE_URL"] ?? "";

  Future<MovieList> getMovieList() async {
    String movieList = RemoteConfig.config["MOVIE_LIST"] ?? "";

    var response = await http.get(
      Uri.parse("$baseUrl$movieList?language=en"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MTA3Yjk2YzhjN2UyZGE5MmRkMTAwNTk5ZjRmOWExOSIsInN1YiI6IjY0ZTVmZTc2NTI1OGFlMDBjOTRiMTI1NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XdhoBzRaIEFEhI4iAWHXe0YnU2oZ_ZeiJCuA9_5i7kI",
      },
    );

    if (response.statusCode == 200) {
      print("=======movieList response======= : " + response.body);
      return movieListFromJson(response.body);
    } else {
      print("movieList error : " + response.body);
      return movieListFromJson(response.body);
    }
  }
}