import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/modules/movie/types/category_type.dart';

abstract class IMovieRepository {
  Movie getById(movieId);
  List<Movie> getByIds(List<int> ids);
  List<Movie> getByCategory(CategoryType category);
  List<Movie> getRandom(int numberOfMovies);
  List<Movie> getWithHighlights();
  List<Movie> getContinueWatching();

  void populate(List<Movie> movies);
  void clear();
}
