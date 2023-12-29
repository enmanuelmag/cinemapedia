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
            : 'https://cdn11.bigcommerce.com/s-nq6l4syi/images/stencil/1280x1280/products/3273/758758/29796-1024__56014.1670458178.jpg?c=2?imbypass=on',
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
            : 'https://cdn11.bigcommerce.com/s-nq6l4syi/images/stencil/1280x1280/products/3273/758758/29796-1024__56014.1670458178.jpg?c=2?imbypass=on',
        posterPath: movieDetails.posterPath != ''
            ? '${Environment.imageUrl}/${movieDetails.posterPath}'
            : 'https://cdn11.bigcommerce.com/s-nq6l4syi/images/stencil/1280x1280/products/3273/758758/29796-1024__56014.1670458178.jpg?c=2?imbypass=on',
      );
}
