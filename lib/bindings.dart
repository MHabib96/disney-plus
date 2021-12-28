import 'package:disney_plus/modules/movie/interfaces/i_movie_repository.dart';
import 'package:disney_plus/modules/movie/repositories/movie_repository.dart';
import 'package:disney_plus/utils/services/interfaces/i_json_service.dart';
import 'package:disney_plus/utils/services/interfaces/i_local_storage_service.dart';
import 'package:disney_plus/utils/services/interfaces/i_movie_service.dart';
import 'package:disney_plus/utils/services/json_service.dart';
import 'package:disney_plus/utils/services/local_storage_service.dart';
import 'package:disney_plus/utils/services/movie_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt services = GetIt.instance;

Future<void> configureServices() async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

  services.registerSingleton<ILocalStorageService>(
      LocalStorageService(sharedPreferences: _sharedPreferences));
  services.registerSingleton<IJsonService>(JsonService());
  services.registerSingleton<IMovieRepository>(MovieRepository());
  services.registerSingleton<IMovieService>(MovieService());
}

Future<void> populateRepositories() async {
  var _jsonService = services.get<IJsonService>();
  var _movieRepository = services.get<IMovieRepository>();
  _movieRepository.populate(await _jsonService.getMoviesFromJson());
}
