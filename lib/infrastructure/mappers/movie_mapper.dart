import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
        id: movieDB.id,
        video: movieDB.video,
        title: movieDB.title,
        adult: movieDB.adult,
        overview: movieDB.overview,
        voteCount: movieDB.voteCount,
        popularity: movieDB.popularity,
        voteAverage: movieDB.voteAverage,
        releaseDate: movieDB.releaseDate,
        originalTitle: movieDB.originalTitle,
        originalLanguage: movieDB.originalLanguage,
        genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
        backdropPath: movieDB.backdropPath != ''
            ? '${Environment.imageUrl}/${movieDB.backdropPath}'
            : 'https://sd.keepcalms.com/i—w600/keep—calm-poster—not—found.jpg',
        posterPath: movieDB.posterPath != ''
            ? '${Environment.imageUrl}/${movieDB.posterPath}'
            : 'no-poster',
      );

  static Movie movieDetailsToEntity(MovieDetails movieDetails) => Movie(
        id: movieDetails.id,
        video: movieDetails.video,
        title: movieDetails.title,
        adult: movieDetails.adult,
        overview: movieDetails.overview,
        voteCount: movieDetails.voteCount,
        popularity: movieDetails.popularity,
        voteAverage: movieDetails.voteAverage,
        releaseDate: movieDetails.releaseDate ?? DateTime.now(),
        originalTitle: movieDetails.originalTitle,
        originalLanguage: movieDetails.originalLanguage,
        genreIds: movieDetails.genres.map((e) => e.name.toString()).toList(),
        backdropPath: movieDetails.backdropPath != ''
            ? '${Environment.imageUrl}/${movieDetails.backdropPath}'
            : 'https://sd.keepcalms.com/i—w600/keep—calm-poster—not—found.jpg',
        posterPath: movieDetails.posterPath != ''
            ? '${Environment.imageUrl}/${movieDetails.posterPath}'
            : 'https://sd.keepcalms.com/i—w600/keep—calm-poster—not—found.jpg',
      );
}
