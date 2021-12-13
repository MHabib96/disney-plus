import 'package:disney_plus/modules/movie/interfaces/i_movie_repository.dart';
import 'package:disney_plus/modules/movie/repositories/movie_repository.dart';
import 'package:disney_plus/utils/services/interfaces/i_json_service.dart';
import 'package:disney_plus/utils/services/json_service.dart';
import 'package:get_it/get_it.dart';

GetIt services = GetIt.instance;

Future<void> configureServices() async {
  services.registerSingleton<IJsonService>(JsonService());
  services.registerSingleton<IMovieRepository>(MovieRepository());
}

Future<void> populateRepositories() async {
  var _jsonService = services.get<IJsonService>();
  var _movieRepository = services.get<IMovieRepository>();
  _movieRepository.populate(await _jsonService.getMoviesFromJson());
}
