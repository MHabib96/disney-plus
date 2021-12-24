part of 'movie_tabs_bloc.dart';

abstract class MovieTabsEvent {}

class ChangeTab extends MovieTabsEvent {
  final MovieTabType tab;
  ChangeTab({required this.tab});
}

class ResetTab extends MovieTabsEvent {}
