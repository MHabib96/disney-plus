import 'package:disney_plus/modules/movie/models/movie.dart';

abstract class IMovieService {
  List<Movie> getSuggestedMovies(Movie movie, int count);
}
