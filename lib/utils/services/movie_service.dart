import 'package:disney_plus/bindings.dart';
import 'package:disney_plus/modules/movie/interfaces/i_movie_repository.dart';
import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/utils/extensions/map_extensions.dart';
import 'package:disney_plus/utils/extensions/iterable_extensions.dart';
import 'package:disney_plus/utils/services/interfaces/i_movie_service.dart';

class MovieService implements IMovieService {
  final _movieRepository = services.get<IMovieRepository>();

  @override
  List<Movie> getSuggestedMovies(Movie movie, int count) {
    var mutualMovies = _movieRepository.getByCategory(movie.category);
    mutualMovies.removeWhere((x) => x.id == movie.id);

    var mutualMoviesWithScore = <int, int>{};

    //Assign score to movie based on mutual actors.
    for (var mutualMovie in mutualMovies) {
      int mutualScore = 0;
      for (var actor in mutualMovie.starring) {
        if (movie.starring.contains(actor)) {
          mutualScore++;
        }
      }
      mutualMoviesWithScore[mutualMovie.id] = mutualScore;
    }

    mutualMoviesWithScore.sortKeysByValue();

    return mutualMoviesWithScore.entries
        .map((e) => mutualMovies.singleWhere((element) => e.key == element.id))
        .takeUpTo(count)
        .toList();
  }
}
