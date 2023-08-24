import 'package:get/state_manager.dart';
import 'package:getonnet_task/models/discover_movie.dart';

import '../utils/api.dart';

class DiscoverMovieController extends GetxController {

  Api api = Api();
  var discoveMovie = DiscoverMovie(page: 0, results: [], totalPages: 0, totalResults: 0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getDiscoverMovieData();
    super.onInit();
  }


  void getDiscoverMovieData() async {
    var discover_movie = await api.discoverMovie();
    if(discover_movie!=null) {
      discoveMovie.value = discover_movie;
    }
  }

}