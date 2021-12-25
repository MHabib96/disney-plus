import 'package:disney_plus/widgets/custom_animated_icon.dart';
import 'package:disney_plus/widgets/movie_utility_buttons/bloc/movie_utility_buttons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'utility_button.dart';

class MovieUtilityButtons extends StatelessWidget {
  final int movieId;

  const MovieUtilityButtons({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieUtilityButtonsBloc, MovieUtilityButtonsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomAnimatedIcon(
              label: 'Watchlist',
              startIcon: Icons.add,
              endIcon: Icons.check,
              startIconColor: Colors.white,
              endIconColor: Colors.blue,
              beginRotation: 0.5,
              padding: const EdgeInsets.all(5),
              duration: const Duration(milliseconds: 500),
              startInReverse: state.watchlistIds.contains(movieId.toString()),
              startIconOnTap: () {
                BlocProvider.of<MovieUtilityButtonsBloc>(context)
                    .add(AddMovieToWatchlist(movieId: movieId));
              },
              endIconOnTap: () {
                BlocProvider.of<MovieUtilityButtonsBloc>(context)
                    .add(RemoveMovieFromWatchlist(movieId: movieId));
              },
            ),
            const _UtilityButton(
              label: 'GroupWatch',
              icon: Icons.groups_rounded,
            ),
            const _UtilityButton(
              label: 'Trailer',
              icon: Icons.movie_creation_outlined,
            ),
            const _UtilityButton(
              label: 'Download',
              icon: Icons.download,
            ),
          ],
        );
      },
    );
  }
}
