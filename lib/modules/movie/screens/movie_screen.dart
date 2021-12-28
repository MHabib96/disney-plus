import 'package:disney_plus/bindings.dart';
import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/utils/services/interfaces/i_movie_service.dart';
import 'package:disney_plus/widgets/movie_tabs/movie_tabs.dart';
import 'package:disney_plus/widgets/movie_utility_buttons/movie_utility_buttons.dart';
import 'package:disney_plus/widgets/movie_wallpaper.dart';
import 'package:disney_plus/modules/movie/types/rating_type.dart';
import 'package:disney_plus/widgets/movie_runtime_information.dart';
import 'package:disney_plus/widgets/movie_streaming_information.dart';
import 'package:disney_plus/widgets/play_button_with_status.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final _movieService = services.get<IMovieService>();

  final Movie movie;

  MovieScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        MovieWallpaper(
          logoImagePath: movie.logoImagePath,
          backgroundImagePath: movie.selectedImagePath,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 80),
              MovieStreamingInformation(
                rating: movie.rating.name,
              ),
              const SizedBox(height: 2),
              MovieRuntimeInformation(
                releaseDate: movie.releaseDate,
                duration: movie.duration,
                genres: movie.genres,
              ),
              const SizedBox(height: 5),
              PlayButtonWithStatus(
                duration: movie.duration,
                watched: movie.watched,
              ),
              const SizedBox(height: 5),
              MovieUtilityButtons(movieId: movie.id),
              const SizedBox(height: 20),
              Text(
                movie.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              MovieTabs(
                suggestedMovies: _movieService.getSuggestedMovies(movie, 6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
