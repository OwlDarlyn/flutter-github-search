import 'package:flutter/material.dart';

class ColorManager {
  static Color main = HexColor.fromHex('#F9F9F9');
  static Color layer1 = HexColor.fromHex('#F2F2F2');
  static Color accentPrimary = HexColor.fromHex('#1463F5');
  static Color accentSecondary = HexColor.fromHex('#E5EDFF');
  static Color textPrimary = HexColor.fromHex('#211814');
  static Color placeHolder = HexColor.fromHex('#BFBFBF');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
