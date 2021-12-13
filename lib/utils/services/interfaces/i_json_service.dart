import 'package:disney_plus/modules/movie/models/movie.dart';

abstract class IJsonService {
  Future<List<Movie>> getMoviesFromJson();
}
