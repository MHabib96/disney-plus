part of 'movie_utility_buttons_bloc.dart';

abstract class MovieUtilityButtonsEvent {}

class AddMovieToWatchlist extends MovieUtilityButtonsEvent {
  final int movieId;
  AddMovieToWatchlist({required this.movieId});
}

class RemoveMovieFromWatchlist extends MovieUtilityButtonsEvent {
  final int movieId;
  RemoveMovieFromWatchlist({required this.movieId});
}
