import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/modules/movie/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies;
  final String? label;
  final double? height;
  final double? horizontalPadding;

  const MovieListView({
    Key? key,
    required this.movies,
    this.label,
    this.height = 130,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 5,
                left: horizontalPadding!,
              ),
              child: Text(
                label!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
        SizedBox(
          height: height,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
            itemCount: movies.length,
            separatorBuilder: (context, index) => const Divider(indent: 8),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MovieScreen(movie: movies[index])),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(movies[index].browseImagePath),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
