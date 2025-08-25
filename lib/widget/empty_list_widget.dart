import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyListWidget extends StatelessWidget {
  final String? title;
  final String content;
  final String imageName;
  final String? btnText;
  final VoidCallback? onBtnTap;
  final double? topHeight;

  const EmptyListWidget({
    Key? key,
    this.title,
    this.content = "No data",
    this.imageName = "ic_empty",
    this.btnText,
    this.onBtnTap,
    this.topHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topHeight ?? 0.12.sh),
        Image.asset(
          MyUtils.getImage(imageName),
          width: 120,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: 12),
        MyUtils.isEmpty(title)
            ? Container()
            : Text(
                title!,
                style: MyTextStyles.textWhiteBold(16),
                textAlign: TextAlign.center,
              ),
        Container(
          margin: EdgeInsets.only(left: 64, right: 64),
          child: Text(
            content,
            style: MyTextStyles.text(14, color: MyTheme.white.withValues(alpha: 0.5)),
            textAlign: TextAlign.center,
          ),
        ),
        if (btnText != null)
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(88),
              border: Border.all(color: MyTheme.white.withValues(alpha: 0.2), width: 1.5),
            ),
            child: GestureDetector(
              onTap: onBtnTap,
              child: Text(
                btnText!,
                style: MyTextStyles.text(12, color: MyTheme.white.withValues(alpha: 0.8)),
              ),
            ),
          ),
      ],
    );
  }
}
