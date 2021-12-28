part of '../movie_tabs.dart';

class _SuggestedTab extends StatelessWidget {
  final List<Movie> suggestedMovies;

  const _SuggestedTab({required this.suggestedMovies});

  @override
  Widget build(BuildContext context) {
    print(suggestedMovies);
    return Column(
      children: [
        for (final movie in suggestedMovies) ...[
          Image.asset(movie.browseImagePath),
        ],
      ],
    );
  }
}
