import 'package:disney_plus/bindings.dart';
import 'package:disney_plus/config/themes/bloc/theme_bloc.dart';
import 'package:disney_plus/modules/base/screens/navigator_base.dart';
import 'package:disney_plus/utils/services/interfaces/i_local_storage_service.dart';
import 'package:disney_plus/widgets/movie_tabs/bloc/movie_tabs_bloc.dart';
import 'package:disney_plus/widgets/movie_utility_buttons/bloc/movie_utility_buttons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureServices();
  await populateRepositories();
  runApp(const DisneyPlus());
}

class DisneyPlus extends StatelessWidget {
  const DisneyPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => MovieTabsBloc()),
        BlocProvider(
          create: (context) => MovieUtilityButtonsBloc(
            localStorageService: services.get<ILocalStorageService>(),
          ),
        ),
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
