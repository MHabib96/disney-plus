part of '../movie_tabs.dart';

class _SuggestedTab extends StatelessWidget {
  final List<Movie> suggestedMovies;

  const _SuggestedTab({required this.suggestedMovies});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      crossAxisCount: 2,
      children: [
        for (final movie in suggestedMovies) ...[
          _SuggestedMovieButton(movie: movie),
        ],
      ],
    );
  }
}

class _SuggestedMovieButton extends StatelessWidget {
  final Movie movie;

  const _SuggestedMovieButton({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieScreen(movie: movie)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(movie.browseImagePath),
        ),
      ),
    );
  }
}
