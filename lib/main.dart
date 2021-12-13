import 'package:disney_plus/config/themes/bloc/theme_bloc.dart';
import 'package:disney_plus/modules/base/screens/navigator_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Disney Plus',
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: const NavigatorBase(),
          );
        },
      ),
    );
  }
}
