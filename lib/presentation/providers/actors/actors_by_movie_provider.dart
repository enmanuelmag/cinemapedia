import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/actors/actor_repository_provider.dart';

import 'package:cinemapedia/domain/entities/actor.dart';

typedef ActorState = Map<String, List<Actor>>;
typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

final actorsProvider =
    StateNotifierProvider<ActorByMovieMapNotifier, ActorState>(
        (ref) {
  final getActorsByMovieId =
      ref.watch(actorRepositoryProvider).getActorsByMovieId;
  return ActorByMovieMapNotifier(getActorsByMovieId);
});


class ActorByMovieMapNotifier extends StateNotifier<ActorState> {
  final GetActorCallback _actorCallback;

  ActorByMovieMapNotifier(this._actorCallback) : super({});

  Future<void> loadActors(String movieId, {bool force = false}) async {
    if (!force && state.containsKey(movieId)) return;

    final actors = await _actorCallback(movieId);

    state = {
      ...state,
      movieId: actors,
    };
  }
}
