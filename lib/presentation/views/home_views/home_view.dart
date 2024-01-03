import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  static const String routeName = '/';
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) {
      return const FullScreenLoader();
    }

    //Special to Slider, get only 6 movies
    final moviesSlider = ref.watch(moviesSliderProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
                title: CustomAppBar(), titlePadding: EdgeInsets.all(0)),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlider(movies: moviesSlider),
                  HorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'On cinemas',
                    subtitle: 'Monday 20',
                    loadNextPage: ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage,
                  ),
                  HorizontalListView(
                    movies: upcomingMovies,
                    title: 'Next releases',
                    loadNextPage:
                        ref.read(upcomingMoviesProvider.notifier).loadNextPage,
                  ),
                  HorizontalListView(
                    movies: popularMovies,
                    title: 'Popular',
                    subtitle: 'Last week',
                    loadNextPage:
                        ref.read(popularMoviesProvider.notifier).loadNextPage,
                  ),
                  HorizontalListView(
                    movies: topRatedMovies,
                    title: 'Best rated',
                    subtitle: 'All times',
                    loadNextPage:
                        ref.read(topRatedMoviesProvider.notifier).loadNextPage,
                  ),
                  const SizedBox(height: 25),
                ],
              );
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}
