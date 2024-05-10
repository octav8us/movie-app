import 'package:json_annotation/json_annotation.dart';

import '../core/networking/constants.dart';

part 'movie_model.g.dart'; // Generated file containing serialization code

@JsonSerializable()
class MovieModel {
  @JsonKey(name: 'backdrop_path', required: false)
  final String? backdropPath;
  final int id;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;

  final String title;
  @JsonKey(
    name: 'release_date',
  )
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  MovieModel({
    this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  // Append the base URL to the poster path
  String get fullPosterPath => '${Constants.imageUrl}$posterPath';
}
