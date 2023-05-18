import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/font_manager.dart';
import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget icon;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
  });

  void goToFavorite(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.favoriteRoute);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: getHeaderStyle(
          color: ColorManager.textPrimary,
          fontSize: FontSize.s16,
        ),
      ),
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
            icon: icon,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}





      // Container(
        // height: 44,
        // alignment: Alignment.center,
        // margin: const EdgeInsets.only(right: 16, top: 5, bottom: 5),
        // decoration: BoxDecoration(
        //     color: ColorManager.accentPrimary,
        //     borderRadius: const BorderRadius.all(Radius.circular(12))),
        // child: IconButton(
        //     onPressed: () => goToFavorite(context),
        //     icon: Icon(
        //       Icons.star,
        //       color: ColorManager.main,
        //     )),
      // ),