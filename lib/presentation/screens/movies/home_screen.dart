import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

const viewRoutes = <Widget>[
  HomeView(),
  CategoriesView(),
  FavoritesView(),
];

class HomeScreen extends StatelessWidget {
  final int pageIndex;

  const HomeScreen(this.pageIndex, {super.key})
      : assert(
          pageIndex >= 0 && pageIndex < viewRoutes.length,
          'Invalid page number',
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigation(pageIndex),
    );
  }
}
