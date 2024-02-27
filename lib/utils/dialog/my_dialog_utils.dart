import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_getx_template/utils/permission_utils.dart';
import 'package:get/get.dart';
import 'my_dialog_widget.dart';
import 'my_popup_alert_message_widget.dart';
import 'popup_complete_profile.dart';

class MyDialogUtils {
  static void showMessageDialog(
    String message, {
    String title = "prompt",
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    Function? onConfirmTap,
    Function? onCancelTap,
    TextStyle? messageStyle,
  }) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return MyDialogWidget(
          title: title,
          message: message,
          messageStyle: messageStyle,
          confirmText: confirmText,
          onConfirmTap: () {
            if (onConfirmTap != null) onConfirmTap();
          },
          cancelText: cancelText,
          onCancelTap: () {
            if (onCancelTap != null) onCancelTap();
          },
        );
      },
    );
  }

  static void showCustomDialog({
    String? title = "prompt",
    String? message,
    Widget? child,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    Function? onConfirmTap,
    Function? onCancelTap,
    TextStyle? messageStyle,
  }) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return MyDialogWidget(
          title: title,
          message: message,
          child: child,
          messageStyle: messageStyle,
          confirmText: confirmText,
          onConfirmTap: () {
            if (onConfirmTap != null) onConfirmTap();
          },
          cancelText: cancelText,
          onCancelTap: () {
            if (onCancelTap != null) onCancelTap();
          },
        );
      },
    );
  }

  static void showPopupAlertMessageSheet(
    BuildContext context,
    String message, {
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    Function? onConfirmTap,
    Function? onCancelTap,
  }) {
    showModalBottomSheet(
      context: context,
      elevation: 10,
      backgroundColor: MyTheme.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      builder: (context) {
        return MyPopupAlertMessageWidget(
          message: message,
          confirmText: confirmText,
          onConfirmTap: () {
            if (onConfirmTap != null) onConfirmTap();
          },
          cancelText: cancelText,
          onCancelTap: () {
            if (onCancelTap != null) onCancelTap();
          },
        );
      },
    );
  }

  static void showUploadPhotoSheet({required Function onConfirmTap}) {
    showModalBottomSheet(
      context: Get.context!,
      elevation: 10,
      backgroundColor: MyTheme.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      builder: (context) {
        return MyPopupAlertMessageWidget(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  "Please upload a photo of yourself that clearly shows your face",
                  style: MyTextStyles.textGrayDeep(14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Image.asset(MyUtils.getImage("y_alert_jpg_add_real_photo")),
                SizedBox(height: 4),
              ],
            ),
          ),
          confirmText: "Choose from Library",
          onConfirmTap: () {
            onConfirmTap();
          },
          cancelText: "Cancel",
        );
      },
    );
  }

  static void showNoPermissionDialog({
    bool isCamera = true,
    bool isPhoto = true,
    bool isMicrophone = true,
  }) {
    String title = "";
    String content = "";
    if (isCamera == true) {
      title = "Epal Would Like to Access the Camera ";
      content =
          "To take photos when updating profile photos, chatting and psoting stories, Epal needs access to your camera.";
    } else if (isPhoto == true) {
      title = "Epal Would Like to Access the Photos";
      content = "To add your favorite pictures to your profile and chatting, Epal needs to access to your photos.";
    } else if (isMicrophone == true) {
      title = "Epal Would Like to Access the Microphone";
      content = "To take videos, Epal needs access to your microphone.";
    }

    showMessageDialog(
      content,
      title: title,
      confirmText: "Setting",
      onConfirmTap: () {
        PermissionUtils.openPermissionSettings();
      },
    );
  }

  /// 提示用户去修改名称
  static void showCompleteProfilePopup({
    required Function() onTap,
    required bool dismissable,
  }) {
    Get.bottomSheet(
      PopupCompleteProfile(
        onTap: onTap,
      ),
      backgroundColor: MyTheme.bg_block_tran,
      isDismissible: dismissable,
    );
  }

  static void showSelectBirthdayBottomSheet(DateChangedCallback onConfirm) {
    var date = DateTime.now();
    var startYear = date.year - 100;
    var endYear = date.year - 18;
    var maxSelectYear = date.year - 18;

    DatePicker.showDatePicker(
      Get.context!,
      showTitleActions: true,
      minTime: DateTime(startYear, date.month, date.day),
      maxTime: DateTime(endYear, date.month, date.day),
      onChanged: (temDate) {
        // if (temDate.year > maxSelectYear ||
        //     (temDate.year == maxSelectYear && temDate.month > date.month) ||
        //     (temDate.year == maxSelectYear && temDate.month == date.month && temDate.day > date.day)) {
        //   MyUtils.showToast("Must be at least 18 years old");
        //   MyUtils.popPage();
        //   showSelectBirthdayBottomSheet(onConfirm);
        // }
      },
      onConfirm: (date) {
        onConfirm.call(date);
      },
      currentTime: DateTime(maxSelectYear - 4, date.month, date.day),
      locale: LocaleType.en,
    );
  }
}
