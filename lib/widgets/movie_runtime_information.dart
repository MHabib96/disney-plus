import 'package:disney_plus/modules/movie/types/genre_type.dart';
import 'package:disney_plus/utils/helpers/string_helper.dart';
import 'package:disney_plus/utils/ui/ui_utils.dart';
import 'package:flutter/material.dart';

class MovieRuntimeInformation extends StatelessWidget {
  final DateTime releaseDate;
  final int duration;
  final List<GenreType> genres;

  const MovieRuntimeInformation({
    Key? key,
    required this.releaseDate,
    required this.duration,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${releaseDate.year}',
          style: kRuntimeInformationStyle,
        ),
        _Bullet(),
        Text(
          formatMovieDuration(duration),
          style: kRuntimeInformationStyle,
        ),
        _Bullet(),
        Flexible(
          child: Text(
            formatGenres(genres),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: kRuntimeInformationStyle,
          ),
        ),
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        '•',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
