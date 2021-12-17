import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/widgets/movie_wallpaper.dart';
import 'package:disney_plus/modules/movie/types/rating_type.dart';
import 'package:disney_plus/widgets/movie_runtime_information.dart';
import 'package:disney_plus/widgets/movie_streaming_information.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;

  const MovieScreen({
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
              const SizedBox(height: 5),
              MovieRuntimeInformation(
                releaseDate: movie.releaseDate,
                duration: movie.duration,
                genres: movie.genres,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
