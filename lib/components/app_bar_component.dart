import 'dart:js';

import 'package:flutter/material.dart';
import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFlowAppBar(context),
      body: const SizedBox(),
    );
  }
}

void goToFavorite(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.favoriteRoute);
}

PreferredSizeWidget _buildFlowAppBar(BuildContext context) {
  return AppBar(
    actions: [
      Container(
        height: 44,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 16, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: ColorManager.accentPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: IconButton(
            onPressed: () => goToFavorite(context),
            icon: Icon(
              Icons.star,
              color: ColorManager.main,
            )),
      ),
      Text(
        AppStrings.searchTitle,
        style: getHeaderStyle(
          color: ColorManager.textPrimary,
          fontSize: FontSize.s16,
        ),
      ),
    ],
  );
}
