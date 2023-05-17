import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
    double lineHeight,
    double letterSpacing) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    height: lineHeight,
    letterSpacing: letterSpacing,
  );
}

TextStyle getHeaderStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.main,
    color,
    LineHeight.h19,
    LetterSpacing.l0,
  );
}

TextStyle getBodyStyle({double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.body,
    color,
    LineHeight.h20,
    LetterSpacing.l0,
  );
}
