part of 'movie_tabs_bloc.dart';

class MovieTabsState extends Equatable {
  final MovieTabType tab;

  const MovieTabsState({required this.tab});

  MovieTabsState copyWith({required MovieTabType tab}) {
    return MovieTabsState(tab: tab);
  }

  @override
  List<Object> get props => [tab];
}
