import 'package:cinemapedia/presentation/screens/movies/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/views/views.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key});

  static int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).fullPath ?? '';

    if (location == HomeView.routeName ||
        location.contains(MovieScreen.routeName)) {
      return 0;
    } else if (location == CategoriesView.routeName) {
      return 1;
    } else if (location == FavoritesView.routeName) {
      return 2;
    }
    return -1;
  }

  void onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(HomeView.routeName);
        break;
      case 1:
        context.go(CategoriesView.routeName);
        break;
      case 2:
        context.go(FavoritesView.routeName);
        break;
      default:
        context.go(HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (index) => onItemTap(context, index),
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          label: 'Categories',
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
