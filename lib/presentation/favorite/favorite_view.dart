import 'package:flutter/material.dart';
import 'package:potje_test_assignment/components/app_bar_component.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        margin: const EdgeInsets.only(right: 16, top: 2, bottom: 2),
        title: AppStrings.favoriteTitle,
        icon: Container(),
      ),
      body: Container(
        child: Center(child: Text('Heloo')),
      ),
    );
  }
}
