import 'dart:convert';

import 'package:disney_plus/modules/movie/models/movie.dart';
import 'package:disney_plus/utils/services/interfaces/i_json_service.dart';
import 'package:flutter/services.dart';

class JsonService implements IJsonService {
  @override
  Future<List<Movie>> deserializeMovies() async {
    final jsonString = await rootBundle.loadString('assets/json/movies.json');
    final jsonMap = await json.decode(jsonString);
    List<Movie> output = [];
    for (var data in jsonMap['data']) {
      output.add(Movie.fromJson(data));
    }
    return output;
  }
}
