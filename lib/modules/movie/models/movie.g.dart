// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'title',
      'category',
      'duration',
      'release_date',
      'rating',
      'description',
      'genres',
      'starring',
      'is_premier',
      'logo_image_path',
      'browse_image_path',
      'selected_image_path',
      'continue_image_path',
      'highlight_image_path'
    ],
  );
  return Movie(
    id: json['id'] as int,
    title: json['title'] as String,
    category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
    duration: json['duration'] as int,
    watched: json['watched'] as int?,
    releaseDate: DateTime.parse(json['release_date'] as String),
    rating: $enumDecode(_$RatingTypeEnumMap, json['rating']),
    description: json['description'] as String,
    genres: (json['genres'] as List<dynamic>)
        .map((e) => $enumDecode(_$GenreTypeEnumMap, e))
        .toList(),
    starring:
        (json['starring'] as List<dynamic>).map((e) => e as String).toList(),
    isPremier: json['is_premier'] as bool,
    logoImagePath: json['logo_image_path'] as String,
    browseImagePath: json['browse_image_path'] as String,
    selectedImagePath: json['selected_image_path'] as String,
    continueImagePath: json['continue_image_path'] as String,
    highlightImagePath: json['highlight_image_path'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': _$CategoryTypeEnumMap[instance.category],
      'duration': instance.duration,
      'watched': instance.watched,
      'release_date': instance.releaseDate.toIso8601String(),
      'rating': _$RatingTypeEnumMap[instance.rating],
      'description': instance.description,
      'genres': instance.genres.map((e) => _$GenreTypeEnumMap[e]).toList(),
      'starring': instance.starring,
      'is_premier': instance.isPremier,
      'logo_image_path': instance.logoImagePath,
      'browse_image_path': instance.browseImagePath,
      'selected_image_path': instance.selectedImagePath,
      'continue_image_path': instance.continueImagePath,
      'highlight_image_path': instance.highlightImagePath,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.Disney: 'Disney',
  CategoryType.Pixar: 'Pixar',
  CategoryType.Marvel: 'Marvel',
  CategoryType.StarWars: 'StarWars',
  CategoryType.NationalGeographic: 'NationalGeographic',
  CategoryType.Star: 'Star',
};

const _$RatingTypeEnumMap = {
  RatingType.Zero: 'Zero',
  RatingType.Six: 'Six',
  RatingType.Twelve: 'Twelve',
  RatingType.Sixteen: 'Sixteen',
};

const _$GenreTypeEnumMap = {
  GenreType.ScienceFiction: 'ScienceFiction',
  GenreType.Fantasy: 'Fantasy',
  GenreType.SuperHero: 'SuperHero',
  GenreType.ActionAdventure: 'ActionAdventure',
  GenreType.Romance: 'Romance',
  GenreType.Drama: 'Drama',
  GenreType.Buddy: 'Buddy',
  GenreType.Spy: 'Spy',
};
