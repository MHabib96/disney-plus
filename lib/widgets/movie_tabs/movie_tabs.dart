import 'package:disney_plus/constants/app_constants.dart';
import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/modules/movie/screens/movie_screen.dart';
import 'package:disney_plus/modules/movie/types/rating_type.dart';
import 'package:disney_plus/utils/helpers/string_helper.dart';
import 'package:disney_plus/widgets/custom_grid_view.dart';
import 'package:disney_plus/widgets/movie_tabs/bloc/movie_tabs_bloc.dart';
import 'package:disney_plus/widgets/movie_tabs/movie_tab_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tabs/suggested_tab.dart';
part 'tabs/extras_tab.dart';
part 'tabs/details_tab.dart';

class MovieTabs extends StatelessWidget {
  final Movie selectedMovie;
  final List<Movie> suggestedMovies;

  const MovieTabs({
    Key? key,
    required this.selectedMovie,
    required this.suggestedMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabsBloc, MovieTabsState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _TabButton(
                    tab: MovieTabType.Suggested,
                    selectedTab: state.tab,
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    tab: MovieTabType.Extras,
                    selectedTab: state.tab,
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    tab: MovieTabType.Details,
                    selectedTab: state.tab,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 0,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            _MovieTabSelector(
              selectedTab: state.tab,
              selectedMovie: selectedMovie,
              suggestedMovies: suggestedMovies,
            ),
          ],
        );
      },
    );
  }
}

class _TabButton extends StatelessWidget {
  final MovieTabType tab;
  final MovieTabType selectedTab;

  const _TabButton({
    required this.tab,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => BlocProvider.of<MovieTabsBloc>(context).add(ChangeTab(tab: tab)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              tab.name.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 15,
              ),
            ),
          ),
          Opacity(
            opacity: tab == selectedTab ? 1 : 0,
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieTabSelector extends StatelessWidget {
  final MovieTabType selectedTab;
  final Movie selectedMovie;
  final List<Movie> suggestedMovies;

  const _MovieTabSelector({
    required this.selectedTab,
    required this.selectedMovie,
    required this.suggestedMovies,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case MovieTabType.Suggested:
        return _SuggestedTab(suggestedMovies: suggestedMovies);
      case MovieTabType.Extras:
        return _ExtrasTab();
      case MovieTabType.Details:
        return _DetailsTab(
          movie: selectedMovie,
        );
    }
  }
}
