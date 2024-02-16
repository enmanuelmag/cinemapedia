import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasources/local_storage.dart';

class IsarDataSource extends LocalStorageDatasource {
  late Future<Isar> _db;

  IsarDataSource() {
    _db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final isar = await _db;

    final Movie? movie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return movie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 20, int offset = 1}) async {
    final isar = await _db;

    final movies =
        await isar.movies.where().offset(offset).limit(limit).findAll();
    return movies;
  }

  @override
  Future<bool> toggleFavorite(Movie movieId) async {
    final isar = await _db;

    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movieId.id).findFirst();

    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return false;
    }

    isar.writeTxnSync(() => isar.movies.putSync(movieId));
    return true;
  }
}
