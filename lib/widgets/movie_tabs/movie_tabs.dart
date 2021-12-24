import 'package:disney_plus/widgets/movie_tabs/bloc/movie_tabs_bloc.dart';
import 'package:disney_plus/widgets/movie_tabs/movie_tab_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieTabs extends StatelessWidget {
  const MovieTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabsBloc, MovieTabsState>(
      builder: (context, state) {
        return Row(
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
