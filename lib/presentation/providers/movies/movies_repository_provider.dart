import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_imp.dart';

// This provider is inmutable, just for read data
final movieRepositoryProvider =
    Provider((ref) => MovieRepositoryImp(MovieDBDataSource()));
