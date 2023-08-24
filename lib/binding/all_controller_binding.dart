import 'package:get/get.dart';
import 'package:getonnet_task/controller/movie_list_controller.dart';

import '../controller/discover_movie_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MovieListController());
    Get.put(DiscoverMovieController());
  }

}