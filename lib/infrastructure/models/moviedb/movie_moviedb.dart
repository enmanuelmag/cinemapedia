class MovieMovieDB {
  MovieMovieDB({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieMovieDB.fromJson(Map<String, dynamic> json) => MovieMovieDB(
        id: json["id"],
        title: json["title"],
        video: json["video"],
        adult: json["adult"] ?? false,
        voteCount: json["vote_count"],
        overview: json["overview"] ?? '',
        posterPath: json["poster_path"] ?? '',
        originalTitle: json["original_title"],
        backdropPath: json["backdrop_path"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        originalLanguage: json["original_language"],
        voteAverage: json["vote_average"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adult": adult,
        "video": video,
        "title": title,
        "overview": overview,
        "vote_count": voteCount,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "backdrop_path": backdropPath,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}
