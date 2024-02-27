import 'package:flutter/material.dart';

import 'my_theme.dart';

class MyTextStyles {
  static TextStyle base({
    double size = 14,
    Color? color,
    bool isBold = false,
    bool isFontWeightBold = false,
    bool isItalic = false,
    TextDecoration? textDecoration,
    String? fontFamily,
  }) =>
      TextStyle(
        fontSize: size,
        color: color != null ? color : MyTheme.block,
        fontWeight: isFontWeightBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: fontFamily != null && fontFamily.length > 0
            ? fontFamily
            : isBold
                ? "Avenir-Bold"
                : "Avenir-Medium",
        decoration: textDecoration == null ? TextDecoration.none : textDecoration,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      );

  static TextStyle title(
    double size, {
    bool isFontWeightBold = true,
    Color color = MyTheme.white,
    String fontFamily = "Avenir-Bold",
  }) =>
      base(
        size: size,
        color: color,
        isFontWeightBold: isFontWeightBold,
        fontFamily: fontFamily,
      );

  static TextStyle text(
    double size, {
    bool isBold = false,
    bool isFontWeightBold = false,
    bool isItalic = false,
    Color color = MyTheme.text_white_block,
  }) =>
      base(
        size: size,
        color: color,
        isBold: isBold,
        isFontWeightBold: isFontWeightBold,
        isItalic: isItalic,
      );

  static TextStyle textWhite(
    double size, {
    bool isBold = false,
    bool isFontWeightBold = false,
    bool isItalic = false,
    TextDecoration? textDecoration,
  }) =>
      base(
        size: size,
        color: MyTheme.white,
        isBold: isBold,
        isFontWeightBold: isFontWeightBold,
        isItalic: isItalic,
        textDecoration: textDecoration,
      );

  static TextStyle textWhiteBold(double size, {bool isFontWeightBold = false, Color color = MyTheme.white}) => base(
        size: size,
        color: color,
        isBold: true,
        isFontWeightBold: isFontWeightBold,
      );

  static TextStyle textGray(double size, {bool isBold = false, TextDecoration? textDecoration}) => base(
        size: size,
        color: MyTheme.text_white_gray_light,
        isBold: isBold,
        textDecoration: textDecoration,
      );

  static TextStyle textGrayDeep(double size, {bool isBold = false}) => base(
        size: size,
        color: MyTheme.text_white_gray_deep,
        isBold: isBold,
      );

  static TextStyle textBlock(double size, {Color color = MyTheme.text_white_block, bool isItalic = false}) => base(
        size: size,
        color: color,
        isItalic: isItalic,
        isBold: false,
        isFontWeightBold: true,
      );

  static TextStyle textBold(double size, {Color color = MyTheme.block}) => base(
        size: size,
        color: color,
        isBold: true,
        isFontWeightBold: true,
      );

  static TextStyle hintStyle(double size, {bool isBold = false}) => base(
        size: size,
        color: const Color(0xFF545456),
        isBold: isBold,
      );

  static TextStyle pointsHintStyle(double size, {bool isBold = false}) => base(
        size: size,
        color: const Color(0xFF767676),
        isBold: isBold,
      );
}
