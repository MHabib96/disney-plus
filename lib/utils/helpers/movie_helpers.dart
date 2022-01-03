import 'package:disney_plus/bindings.dart';
import 'package:disney_plus/modules/movie/interfaces/i_movie_repository.dart';
import 'package:disney_plus/modules/movie/models/movie.dart';

final _movieRepository = services.get<IMovieRepository>();

List<Movie> getMoviesFromIds(List<int> ids) {
  return ids.map((id) => _movieRepository.getById(id)).toList();
}
