import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.main,
  );
}
