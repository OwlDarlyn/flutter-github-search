import 'package:flutter/material.dart';
import 'package:potje_test_assignment/components/app_bar_component.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.favoriteTitle),
      body: Container(
        child: Text('Heloo'),
      ),
    );
  }
}
