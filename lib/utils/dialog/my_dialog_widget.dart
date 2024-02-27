import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';

/// 自定义 Dialog
class MyDialogWidget extends StatefulWidget {
  final String? title;
  final String? message;
  final TextStyle? messageStyle;
  final String? confirmText;
  final String? cancelText;
  final Function? onConfirmTap;
  final Function? onCancelTap;
  final Widget? child;
  final String? doubleConfirmText;
  final Function? onDoubleConfirmTap;
  final bool isDisMissConfirm;

  const MyDialogWidget({
    Key? key,
    this.title,
    this.message,
    this.child,
    this.confirmText,
    this.cancelText,
    this.onConfirmTap,
    this.onCancelTap,
    this.messageStyle,
    this.doubleConfirmText,
    this.onDoubleConfirmTap,
    this.isDisMissConfirm = true,
  }) : super(key: key);

  @override
  _MyDialogWidgetState createState() => _MyDialogWidgetState();
}

class _MyDialogWidgetState extends State<MyDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 32, right: 32),
            decoration: const BoxDecoration(
              color: MyTheme.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 28,
              bottom: 6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyUtils.isEmpty(widget.title) ? Container() : Text(widget.title!, style: MyTextStyles.textBold(18)),
                MyUtils.isEmpty(widget.title) ? Container() : const SizedBox(height: 16),
                // 如果没有传入 message ，则一定是自定义布局
                _contentView(),
                const SizedBox(height: 42),
                MyUtils.isEmpty(widget.confirmText)
                    ? Container()
                    : _conformButton(widget.confirmText!, widget.onConfirmTap),
                MyUtils.isEmpty(widget.doubleConfirmText) ? Container() : const SizedBox(height: 10),
                MyUtils.isEmpty(widget.doubleConfirmText)
                    ? Container()
                    : _conformButton(widget.doubleConfirmText!, widget.onDoubleConfirmTap),
                const SizedBox(height: 8),
                MyUtils.isEmpty(widget.cancelText) ? Container() : _cancelButton(),
                MyUtils.isEmpty(widget.cancelText) ? const SizedBox(height: 20) : const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 如果没有传入 message ，则一定是自定义布局
  _contentView() {
    return MyUtils.isEmpty(widget.message)
        ? widget.child
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.message!,
              style: widget.messageStyle ?? MyTextStyles.textGrayDeep(14),
              textAlign: TextAlign.center,
            ),
          );
  }

  /// 确定按钮
  _conformButton(String text, Function? onTap) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: MaterialButton(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: MyTheme.primaryText,
        elevation: 1,
        highlightElevation: 0,
        disabledElevation: 0,
        onPressed: () {
          if (widget.isDisMissConfirm) MyUtils.popPage();

          if (onTap != null) onTap();
        },
        child: Text(text, style: MyTextStyles.textWhite(16, isFontWeightBold: true)),
      ),
    );
  }

  /// 取消按钮
  _cancelButton() {
    return ButtonTheme(
      minWidth: double.infinity,
      child: MaterialButton(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: MyTheme.transparent,
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        highlightColor: MyTheme.transparent,
        splashColor: MyTheme.transparent,
        onPressed: () {
          MyUtils.popPage();

          if (widget.onCancelTap != null) {
            widget.onCancelTap!();
          }
        },
        child: Text(widget.cancelText ?? "取消", style: MyTextStyles.textGray(14)),
      ),
    );
  }
}
