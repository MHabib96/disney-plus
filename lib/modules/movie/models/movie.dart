import 'package:disney_plus/modules/movie/types/category_type.dart';
import 'package:disney_plus/modules/movie/types/genre_type.dart';
import 'package:disney_plus/modules/movie/types/rating_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String title;

  @JsonKey(required: true)
  final CategoryType category;

  @JsonKey(required: true)
  final int duration;

  final int? watched;

  @JsonKey(required: true, name: 'release_date')
  final DateTime releaseDate;

  @JsonKey(required: true)
  final RatingType rating;

  @JsonKey(required: true)
  final String description;

  @JsonKey(required: true)
  final List<GenreType> genres;

  @JsonKey(required: true)
  final List<String> starring;

  @JsonKey(required: true, name: 'is_premier')
  final bool isPremier;

  @JsonKey(required: true, name: 'logo_image_path')
  final String logoImagePath;

  @JsonKey(required: true, name: 'browse_image_path')
  final String browseImagePath;

  @JsonKey(required: true, name: 'selected_image_path')
  final String selectedImagePath;

  @JsonKey(required: true, name: 'continue_image_path')
  final String continueImagePath;

  @JsonKey(required: true, name: 'highlight_image_path')
  final String highlightImagePath;

  Movie({
    required this.id,
    required this.title,
    required this.category,
    required this.duration,
    this.watched,
    required this.releaseDate,
    required this.rating,
    required this.description,
    required this.genres,
    required this.starring,
    required this.isPremier,
    required this.logoImagePath,
    required this.browseImagePath,
    required this.selectedImagePath,
    required this.continueImagePath,
    required this.highlightImagePath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
