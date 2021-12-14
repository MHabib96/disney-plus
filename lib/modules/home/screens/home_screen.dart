import 'package:disney_plus/modules/home/slivers/sliver_home_app_bar.dart';
import 'package:disney_plus/modules/movie/interfaces/i_movie_repository.dart';
import 'package:disney_plus/widgets/category_buttons.dart';
import 'package:disney_plus/widgets/movie_highlight_showcase.dart';
import 'package:flutter/material.dart';
import 'package:disney_plus/bindings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _movieRepository = services.get<IMovieRepository>();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverPersistentHeader(
            delegate: SliverHomeAppBar(
              minExtent: 90,
              maxExtent: 90,
              topPadding: 10,
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          MovieHighlightShowcase(
            movies: _movieRepository.getWithHighlights(),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: CategoryButtons(),
          ),
        ],
      ),
    );
  }
}
