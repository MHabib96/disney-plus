import 'package:bloc/bloc.dart';
import 'package:disney_plus/widgets/movie_tabs/movie_tab_type.dart';
import 'package:equatable/equatable.dart';

part 'movie_tabs_event.dart';
part 'movie_tabs_state.dart';

class MovieTabsBloc extends Bloc<MovieTabsEvent, MovieTabsState> {
  MovieTabsBloc() : super(const MovieTabsState(tab: MovieTabType.Suggested));

  @override
  Stream<MovieTabsState> mapEventToState(MovieTabsEvent event) async* {
    if (event is ChangeTab) {
      yield state.copyWith(tab: event.tab);
    }
    if (event is ResetTab) {
      yield state.copyWith(tab: MovieTabType.Suggested);
    }
  }
}
