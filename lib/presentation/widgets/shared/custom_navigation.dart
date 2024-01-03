import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomNavigation(this.currentIndex, {super.key});

  void onItemTapped(int index, BuildContext context) {
    if (index != currentIndex) {
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (index) => onItemTapped(index, context),
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
