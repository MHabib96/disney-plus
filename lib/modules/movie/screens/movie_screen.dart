import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/widgets/movie_presentation.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;

  const MovieScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          MoviePresentaion(
            logoImagePath: movie.logoImagePath,
            backgroundImagePath: movie.selectedImagePath,
          )
        ],
      ),
    );
  }
}
