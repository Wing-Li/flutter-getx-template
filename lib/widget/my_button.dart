import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义按钮组件
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool enabled;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderWidth;

  const MyButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.isLoading = false,
    this.enabled = true,
    this.icon,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.fontWeight,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDisabled = !enabled || onPressed == null;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: isDisabled ? null : (isLoading ? null : onPressed),
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled //
              ? MyTheme.text_white_gray_light.withValues(alpha: 0.3)
              : backgroundColor ?? MyTheme.bg_btn_block,
          foregroundColor: isDisabled //
              ? MyTheme.text_white_gray_deep
              : textColor ?? MyTheme.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.r),
            side: borderColor != null
                ? BorderSide(
                    color: isDisabled //
                        ? MyTheme.text_white_gray_light.withValues(alpha: 0.3)
                        : borderColor!,
                    width: borderWidth ?? 1.w,
                  )
                : BorderSide.none,
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    final textStyle = MyTextStyles.text(
      fontSize ?? 16.sp,
      isBold: fontWeight == FontWeight.bold,
      color: textColor ?? MyTheme.white,
    );

    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(textStyle.color),
            ),
          ),
          SizedBox(width: 12.w),
          Text(text, style: textStyle),
        ],
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          SizedBox(width: 12.w),
          Text(text, style: textStyle),
        ],
      );
    }

    return Text(text, style: textStyle);
  }
}
