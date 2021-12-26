import 'package:bloc/bloc.dart';
import 'package:disney_plus/utils/services/interfaces/i_local_storage_service.dart';
import 'package:equatable/equatable.dart';

part 'movie_utility_buttons_event.dart';
part 'movie_utility_buttons_state.dart';

class MovieUtilityButtonsBloc extends Bloc<MovieUtilityButtonsEvent, MovieUtilityButtonsState> {
  final ILocalStorageService localStorageService;

  MovieUtilityButtonsBloc({required this.localStorageService})
      : super(MovieUtilityButtonsState(watchlistIds: localStorageService.watchlistIds));

  @override
  Stream<MovieUtilityButtonsState> mapEventToState(MovieUtilityButtonsEvent event) async* {
    if (event is AddMovieToWatchlist) {
      var _uniqueIds = localStorageService.watchlistIds.toSet();
      if (_uniqueIds.add(event.movieId.toString())) {
        var _ids = _uniqueIds.toList();
        localStorageService.watchlistIds = _ids;
        yield state.copyWith(watchlistIds: _ids);
      }
    }
    if (event is RemoveMovieFromWatchlist) {
      var _uniqueIds = localStorageService.watchlistIds.toSet();
      if (_uniqueIds.remove(event.movieId.toString())) {
        var _ids = _uniqueIds.toList();
        localStorageService.watchlistIds = _ids;
        yield state.copyWith(watchlistIds: _ids);
      }
    }
  }
}
