part of 'movie_utility_buttons_bloc.dart';

class MovieUtilityButtonsState extends Equatable {
  final List<String> watchlistIds;

  const MovieUtilityButtonsState({required this.watchlistIds});

  MovieUtilityButtonsState copyWith({required List<String> watchlistIds}) {
    return MovieUtilityButtonsState(watchlistIds: watchlistIds);
  }

  @override
  List<Object> get props => [watchlistIds];
}
