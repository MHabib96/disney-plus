import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/widgets/base/widget_size.dart';
import 'package:disney_plus/widgets/helpers/watch_status_bar.dart';
import 'package:flutter/material.dart';

class MovieContinueListView extends StatelessWidget {
  final List<Movie> movies;
  final String? label;
  final double? height;
  final double? horizontalPadding;

  const MovieContinueListView({
    Key? key,
    required this.movies,
    this.label,
    this.height = 150,
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
              return _ContinueWatchingMovie(movie: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ContinueWatchingMovie extends StatelessWidget {
  final Movie movie;

  const _ContinueWatchingMovie({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Continue watching ${movie.title}'),
      child: WidgetSize(
        builder: (context, size, child) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(movie.continueImagePath),
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.play_arrow_rounded),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            primary: Colors.black.withOpacity(0.5)),
                      ),
                      WatchStatusBar(
                        duration: movie.duration,
                        watched: movie.watched!,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
