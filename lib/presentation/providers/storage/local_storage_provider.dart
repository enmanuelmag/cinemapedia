import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/repositories/local_store_repository.dart';
import 'package:cinemapedia/infrastructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageProvider = Provider<LocalStorageRepository>(
  (ref) => LocalStorageRepositoryImpl(IsarDataSource()),
);

final isFavoriteProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageProvider);
  return localStorageRepository.isFavorite(movieId);
});
