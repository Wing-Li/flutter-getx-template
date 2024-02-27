import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  required void Function()? onPressed,
  double width = 140,
  double height = 44,
  Color bgColor = MyTheme.text_white_block,
  String title = "button",
  Color fontColor = MyTheme.text_white_block,
  double fontSize = 18,
  String fontName = "Montserrat",
  BorderRadiusGeometry? borderRadius,
}) {
  return Container(
    width: width,
    height: height,
    child: TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else if (states.contains(MaterialState.pressed)) {
              return Colors.deepPurple;
            }
            return fontColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[200];
          }
          return bgColor;
        }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        )),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: MyTextStyles.text(
          fontSize.spMin,
          color: fontColor,
          isBold: true,
        ),
        strutStyle: StrutStyle(forceStrutHeight: true, height: 1.15),
      ),
      onPressed: onPressed,
    ),
  );
}

/// 文字圆形按钮
Widget btnText({
  required String text,
  Function()? onTap,
  double? width,
  double height = 22,
  Color? bgColor,
  Color? borderColor,
  double borderWidth = 1.2,
  double? borderRadius,
  TextStyle? fontStyle,
  EdgeInsetsGeometry? padding,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius ?? height),
        border: borderColor == null ? null : Border.all(color: borderColor, width: borderWidth),
      ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 9),
      alignment: Alignment.center,
      child: Text(
        text,
        style: fontStyle ?? MyTextStyles.text(12, color: MyTheme.text_white_block),
        strutStyle: const StrutStyle(forceStrutHeight: true, height: 1),
      ),
    ),
  );
}
