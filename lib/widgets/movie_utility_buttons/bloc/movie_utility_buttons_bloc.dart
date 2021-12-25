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
      var _watchlistIds = localStorageService.watchlistIds;
      _watchlistIds.add(event.movieId.toString());
      localStorageService.watchlistIds = _watchlistIds;
      yield state.copyWith(watchlistIds: _watchlistIds);
    }
    if (event is RemoveMovieFromWatchlist) {
      var _watchlistIds = localStorageService.watchlistIds;
      _watchlistIds.remove(event.movieId.toString());
      localStorageService.watchlistIds = _watchlistIds;
      yield state.copyWith(watchlistIds: _watchlistIds);
    }
  }
}
