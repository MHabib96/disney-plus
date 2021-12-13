import 'package:bloc/bloc.dart';
import 'package:disney_plus/config/themes/app_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: appThemes[AppTheme.Default]!));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield state.copyWith(themeData: appThemes[event.theme]!);
    }
  }
}
