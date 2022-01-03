import 'dart:math';
import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/modules/movie/interfaces/i_movie_repository.dart';
import 'package:disney_plus/modules/movie/types/category_type.dart';

class MovieRepository implements IMovieRepository {
  final List<Movie> _movies = [];

  @override
  Movie getById(movieId) {
    return _movies.firstWhere((movie) => movie.id == movieId);
  }

  @override
  List<Movie> getByIds(List<int> ids) {
    return ids.map((id) => getById(id)).toList();
  }

  @override
  List<Movie> getByCategory(CategoryType category) {
    return _movies.where((movie) => movie.category == category).toList();
  }

  @override
  List<Movie> getRandom(int numberOfMovies) {
    final random = Random();
    List<Movie> randomMovies = [];
    for (int i = 0; i < numberOfMovies; i++) {
      var movie = _movies[random.nextInt(_movies.length)];
      randomMovies.add(movie);
    }
    return randomMovies;
  }

  @override
  List<Movie> getWithHighlights() {
    return _movies.where((movie) => movie.highlightImagePath.isNotEmpty).toList();
  }

  @override
  void populate(List<Movie> movies) {
    clear();
    _movies.addAll(movies);
  }

  @override
  void clear() {
    _movies.clear();
  }
}
