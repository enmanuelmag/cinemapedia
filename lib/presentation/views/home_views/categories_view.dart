import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  static const String routeName = '/categories';

  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories View'),
      ),
      body: const Center(
        child: Text('Categories'),
      ),
    );
  }
}
