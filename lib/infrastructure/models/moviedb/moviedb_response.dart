import 'movie_moviedb.dart';

class MovieDbResponse {
  MovieDbResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final Dates? dates;
  final int page;
  final List<MovieMovieDB> results;
  final int totalPages;
  final int totalResults;

  factory MovieDbResponse.fromJson(Map<String, dynamic> json) =>
      MovieDbResponse(
        page: json["page"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
        dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null,
        results: List<MovieMovieDB>.from(
            json["results"].map((x) => MovieMovieDB.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "dates": dates?.toJson(),
        "total_pages": totalPages,
        "total_results": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
