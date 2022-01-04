import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/utils/helpers/string_helper.dart';
import 'package:disney_plus/widgets/base/widget_size.dart';
import 'package:disney_plus/widgets/helpers/watch_status_bar.dart';
import 'package:flutter/material.dart';

class ContinueMovieListView extends StatelessWidget {
  final List<Movie> movies;
  final String? label;
  final double? height;
  final double? horizontalPadding;

  const ContinueMovieListView({
    Key? key,
    required this.movies,
    this.label,
    this.height = 200,
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
              return _ContinueWatchingButton(movie: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ContinueWatchingButton extends StatelessWidget {
  final Movie movie;

  const _ContinueWatchingButton({required this.movie});

  @override
  Widget build(BuildContext context) {
    var _remainder = movie.duration - movie.watched!;

    return GestureDetector(
      onTap: () => print('Continue watching ${movie.title}'),
      child: WidgetSize(
        builder: (context, size, child) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.asset(movie.continueImagePath),
                      SizedBox(
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: _WatchBarWithPlay(
                            duration: movie.duration,
                            watched: movie.watched!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    child: Text('${movie.title}\n${formatMovieDuration(_remainder)} remaining'),
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _WatchBarWithPlay extends StatelessWidget {
  final int duration;
  final int watched;

  const _WatchBarWithPlay({
    Key? key,
    required this.duration,
    required this.watched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            primary: Colors.black.withOpacity(0.5),
          ),
        ),
        WatchStatusBar(
          duration: duration,
          watched: watched,
        ),
      ],
    );
  }
}
