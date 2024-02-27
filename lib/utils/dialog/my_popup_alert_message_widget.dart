import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPopupAlertMessageWidget extends StatefulWidget {
  final Widget? child;
  final String? message;
  final String confirmText;
  final Color? confirmBgColor;
  final Function? onConfirmTap;
  final String cancelText;
  final Function? onCancelTap;

  const MyPopupAlertMessageWidget({
    Key? key,
    this.child,
    this.message,
    this.confirmText = "Confirm",
    this.confirmBgColor,
    this.onConfirmTap,
    this.cancelText = "Cancel",
    this.onCancelTap,
  }) : super(key: key);

  @override
  _MyPopupAlertMessageWidgetState createState() => _MyPopupAlertMessageWidgetState();
}

class _MyPopupAlertMessageWidgetState extends State<MyPopupAlertMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.h, ScreenUtil().bottomBarHeight + 16.h),
      decoration: const BoxDecoration(
        color: MyTheme.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          widget.child != null
              ? widget.child!
              : Container(
                  color: MyTheme.transparent,
                  height: 54,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    widget.message ?? "",
                    style: MyTextStyles.textWhite(14),
                    textAlign: TextAlign.center,
                  ),
                ),
          InkWell(
            child: Container(
              height: 54,
              margin: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                color: widget.confirmBgColor ?? MyTheme.transparent,
                borderRadius: BorderRadius.circular(widget.confirmBgColor != null ? 54 : 0),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.confirmText,
                style: MyTextStyles.text(16, color: widget.confirmBgColor ?? MyTheme.white),
              ),
            ),
            onTap: () {
              MyUtils.popPage();
              if (widget.onConfirmTap != null) widget.onConfirmTap!();
            },
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 56,
                color: MyTheme.bg_btn_cancel,
                textColor: MyTheme.text_block_gray_deep,
                onPressed: () {
                  MyUtils.popPage();
                  if (widget.onCancelTap != null) widget.onCancelTap!();
                },
                child: Text(widget.cancelText, style: MyTextStyles.textGrayDeep(14)),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
