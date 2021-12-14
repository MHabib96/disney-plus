import 'package:carousel_slider/carousel_slider.dart';
import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/modules/movie/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class MovieHighlightShowcase extends StatelessWidget {
  final List<Movie> movies;

  const MovieHighlightShowcase({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (var movie in movies) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: _HighlightSlide(movie: movie),
          ),
        ],
      ],
      options: CarouselOptions(
        aspectRatio: 4 / 2,
        viewportFraction: 0.95,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class _HighlightSlide extends StatelessWidget {
  final Movie movie;

  const _HighlightSlide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieScreen(movie: movie)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(movie.highlightImagePath, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
