import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;

  const MovieScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Movie Screen',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
