import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';
import 'package:potje_test_assignment/presentation/resources/styles_manager.dart';
import 'package:potje_test_assignment/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.accentPrimary,
    disabledColor: ColorManager.placeHolder,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorManager.accentSecondary),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.main,
      elevation: AppSize.s4,
      titleTextStyle: getHeaderStyle(color: ColorManager.textPrimary),
    ),
  );
}
