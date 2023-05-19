import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  void goToSearch(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.searchRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.favoriteTitle,
            style: getHeaderStyle(
              color: ColorManager.textPrimary,
              fontSize: FontSize.s16,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.only(left: 16, top: 10),
            height: 44,
            padding: const EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
                color: ColorManager.accentPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: IconButton(
                onPressed: () => goToSearch(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.main,
                  size: 28,
                )),
          ),
          leadingWidth: 62,
        ),
        body: Center(
          child: Text(
            textAlign: TextAlign.center,
            AppStrings.nothingFavorite,
            style: getBodyStyle(
              color: ColorManager.placeHolder,
              fontSize: FontSize.s14,
            ),
          ),
        ));
  }
}
