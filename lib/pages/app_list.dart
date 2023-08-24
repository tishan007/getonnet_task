import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getonnet_task/controller/discover_movie_controller.dart';

import '../controller/movie_list_controller.dart';
import '../utils/api.dart';

class AppList extends StatefulWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList>  with TickerProviderStateMixin {

  TabController? _tabController;
  Api api = Api();
  int tappedIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put(MovieListController());
    Get.put(DiscoverMovieController());
    Get.find<MovieListController>().getMovieListData();
    Get.find<MovieListController>().movieList.value.genres.length;
    _tabController = TabController(vsync: this, length: Get.find<MovieListController>().movieList.value.genres.length);
    Get.find<DiscoverMovieController>().getDiscoverMovieData();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MovieListController());
    Get.find<MovieListController>().getMovieListData();
    print("length 1st: ${Get.find<MovieListController>().movieList.value.genres.length}");
    return ListView(
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 30,),
        const Center(child: Text("App name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
        const SizedBox(height: 5,),
        const Divider(
          height: 15,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.grey,
        ),
        const SizedBox(height: 10,),

        _tabBar(),
      ],
    );
  }

  _tabBar() {
    Get.find<MovieListController>().getMovieListData();
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: const Color(0XFFEEDDFF),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0XFFFAF6FF),
            spreadRadius: 0,
            blurRadius: 3,
          ),
        ],
      ),
      child: DefaultTabController(
        length: Get.find<MovieListController>().movieList.value.genres.length,
        //length: 19,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20.0)),
                child: TabBar(
                  //controller: _tabController,
                  isScrollable: true,
                  onTap: (index) {
                    setState(() {
                      if (kDebugMode) {
                        //print("selected tabIndex : ${_tabController?.index}");
                        print("selected tabIndex : $index");
                        tappedIndex = index;
                      }
                    });
                  },
                  padding: const EdgeInsets.all(5),
                  indicator: BoxDecoration(
                    color: Color(0xff0241C5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  /*tabs: [
                              const Tab(
                                text: 'Actions',
                              ),
                              Tab(
                                text: '${snapshot.data?.genres.first.name}',
                              ),
                              const Tab(
                                text: 'Actions',
                              ),
                              const Tab(
                                text: 'Adventure',
                              ),
                              const Tab(
                                text: 'Actions',
                              ),
                              const Tab(
                                text: 'Adventure',
                              ),
                            ],*/
                  tabs: Get.find<MovieListController>().movieList.value.genres.map((e) {
                    print("length : ${Get.find<MovieListController>().movieList.value.genres.length}");
                    return Text(e.name);
                  }).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  //controller: _tabController,
                  /*children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("1st"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("2nd"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("3rd"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("4th"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("5th"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text("6th"),
                              ),
                            ],*/
                  children: Get.find<MovieListController>().movieList.value.genres.map((e) {
                    return Column(
                      children: [
                        Center(child: SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  Obx(() {
                                    return Text("Movie Genres Id : ${Get
                                        .find<MovieListController>()
                                        .movieList
                                        .value
                                        .genres[tappedIndex].id}");
                                  }),
                                  const SizedBox(height: 20,),
                                  _discoverMovie()
                                ],
                              ))),
                        )
                        ),
                      ],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _discoverMovie() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Obx(() {
                return Column(
                  children: [
                    Text("Title : ${Get.find<DiscoverMovieController>().discoveMovie.value.results[tappedIndex].title}"),
                    const SizedBox(height: 10,),
                    Text("Vote : ${Get.find<DiscoverMovieController>().discoveMovie.value.results[tappedIndex].voteCount}"),
                    const SizedBox(height: 10,),
                    Text("Release Date : ${Get.find<DiscoverMovieController>().discoveMovie.value.results[tappedIndex].releaseDate}"),
                  ],
                );
              })
    );
  }

}
