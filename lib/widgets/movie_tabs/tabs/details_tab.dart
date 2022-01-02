part of '../movie_tabs.dart';

class _DetailsTab extends StatelessWidget {
  final Movie movie;

  const _DetailsTab({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - (kMovieScreenPadding * 2);

    return SizedBox(
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(movie.description),
          const SizedBox(height: 20),
          Text('Duration:\n${formatMovieDuration(movie.duration)}'),
          const SizedBox(height: 10),
          Text('Release date:\n${movie.releaseDate.year}'),
          const SizedBox(height: 10),
          Text('Genre:\n${formatGenres(movie.genres)}'),
          const SizedBox(height: 10),
          Text('Rating:\n${movie.rating.nameAsNumber}'),
          const SizedBox(height: 10),
          Text('Starring:\n${formatStarring(movie.starring)}'),
        ],
      ),
    );
  }
}
