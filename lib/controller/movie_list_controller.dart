import 'package:get/state_manager.dart';

import '../models/movie_list.dart';
import '../utils/api.dart';

class MovieListController extends GetxController {

  Api api = Api();
  var movieList = MovieList(genres: []).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getMovieListData();
    super.onInit();
  }


  void getMovieListData() async {
    var movie_list = await api.getMovieList();
    if(movie_list!=null) {
      movieList.value = movie_list;
    }
  }

}