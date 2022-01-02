import 'package:disney_plus/modules/movie/types/genre_type.dart';

String formatMovieDuration(int duration) {
  int hours = duration ~/ 60;
  int minutes = duration % 60;
  return '$hours\h $minutes\m';
}

String formatGenres(List<GenreType> genres) {
  var buffer = StringBuffer();
  for (int i = 0; i < genres.length; i++) {
    buffer.write(genres[i].name);
    if (i != genres.length - 1) {
      buffer.write(', ');
    }
  }
  return buffer.toString();
}

String formatStarring(List<String> actors) {
  var buffer = StringBuffer();
  for (var actor in actors) {
    buffer.write('$actor\n');
  }
  return buffer.toString();
}
