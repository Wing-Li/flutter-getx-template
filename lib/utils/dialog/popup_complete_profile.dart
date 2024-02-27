import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_getx_template/view/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupCompleteProfile extends StatefulWidget {
  final Function() onTap;

  const PopupCompleteProfile({
    super.key,
    required this.onTap,
  });

  @override
  State<PopupCompleteProfile> createState() => _PopupCompleteProfileState();
}

class _PopupCompleteProfileState extends State<PopupCompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          24.w, 32.h, 24.h, ScreenUtil().bottomBarHeight + 16.h),
      decoration: BoxDecoration(
        color: MyTheme.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(MyUtils.getImage("ic_edit_name_flag"), width: 120.w),
          SizedBox(height: 20.h),
          Text(
            "Complete Your Profile",
            style: MyTextStyles.textWhite(16, isBold: true),
          ),
          SizedBox(height: 6.h),
          Text(
            "A better profile indicates better potential. Make it perfect to attract more people.",
            style: MyTextStyles.textGrayDeep(12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 80.h),
          Container(
            child: btnText(
              width: double.infinity,
              height: 44,
              bgColor: MyTheme.white,
              fontStyle: MyTextStyles.textBold(16),
              text: "Complete Profile",
              onTap: () {
                MyUtils.popPage();
                widget.onTap.call();
              },
            ),
          ),
          SizedBox(height: 40.w),
        ],
      ),
    );
  }
}
