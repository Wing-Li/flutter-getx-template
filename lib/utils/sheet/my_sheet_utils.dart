import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_getx_template/widget/layout/my_app_bar.dart';
import 'package:flutter_getx_template/widget/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MySheetUtils {
  static Future<dynamic> showSheet({
    required String title,
    required Widget widget,
    double? height,
    bool isScrollControlled = false,
  }) {
    return Get.bottomSheet(
      Container(
        height: height,
        child: Column(
          children: [
            MyAppBar(
              leftWidget: MyTitle(title),
              rightWidget: GestureDetector(
                child: Image.asset(MyUtils.getImage("ic_close"), width: 24),
                onTap: () => Get.back(),
              ),
              isShowStatusBar: false,
            ),
            Expanded(child: widget),
          ],
        ),
      ),
      backgroundColor: MyTheme.bg_sheet,
      isScrollControlled: isScrollControlled,
    );
  }

  /// 显示确认的弹框
  static void showConfirmSheet({
    required String title,
    String? content,
    String? confirmText,
    required VoidCallback onConfirm,
    bool isShowCancel = true,
    String? cancelText,
    VoidCallback? onCancel,
    double? height,
  }) {
    showSheet(
      title: title,
      widget: SafeArea(
        bottom: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (content != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    content,
                    style: MyTextStyles.textGray(14),
                  ),
                ),
              Spacer(),
              MyButton(
                onPressed: () {
                  Get.back();
                  onConfirm.call();
                },
                text: confirmText ?? "Confirm",
                height: 48,
              ),
              if (isShowCancel)
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MyButton(
                    onPressed: () {
                      Get.back();
                      onCancel?.call();
                    },
                    backgroundColor: MyTheme.white.withValues(alpha: 0.1),
                    text: cancelText ?? "Cancel",
                    textColor: MyTheme.white.withValues(alpha: 0.7),
                    height: 48,
                  ),
                ),
              Spacer(),
            ],
          ),
        ),
      ),
      height: height ?? 240.w,
    );
  }
}
