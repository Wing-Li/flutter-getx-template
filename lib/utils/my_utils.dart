import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUtils {
  static bool isProd() {
    return true;
  }

  /// 判断 字符串 是否为空
  static bool isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// 邮箱正则
  static const String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";

  /// 检查是否是邮箱格式
  static bool isEmail(String input) {
    if (isEmpty(input)) return false;
    return RegExp(regexEmail).hasMatch(input);
  }

  /// 跳转页面
  static Future<dynamic>? startPage(BuildContext context, Widget page) async {
    return Get.to(page, transition: Transition.fade);
    // return await Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  /// 跳转新页面，并关闭当前页面
  static Future<dynamic>? offPage(Widget page) async {
    return Get.off(page, transition: Transition.fade);
  }

  static Future<dynamic>? offAllPage(Widget page) async {
    return Get.offAll(page, transition: Transition.fade);
  }

  /// 跳转页面，带渐变动画
  static Future<dynamic>? startPageGradient(Widget page, {int duration = 350}) async {
    return Get.to(page, transition: Transition.fadeIn, duration: Duration(milliseconds: duration));
  }

  /// 从下往上划出
  static Future<dynamic>? startPageUpAnim(Widget page, {int duration = 350}) async {
    return Get.to(page, transition: Transition.downToUp, duration: Duration(milliseconds: duration));
  }

  /// 关闭页面
  static void popPage({dynamic result}) {
    Get.back(result: result);
  }

  /// 关闭App
  static exitApp() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  /// 打开 Url
  static void openUrl(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 打印 log
  static void log(dynamic object, {String? method}) {
    if (!isProd()) {
      if (!isEmpty(method)) logDebug("方法：$method");
      logDebug(object);
    }
  }

  /// 复制文字
  static void copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
    showToast('复制成功');
  }

  /// 获取剪贴板上的文字
  static Future<String> getCopyText() async {
    var data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text ?? "";
  }

  /// 分享
  static void shareText(String content, {String? title}) {
    Share.share(content, subject: title);
  }

  /// 显示 Toast
  static void showToast(String msg, {bool isLongTime = false}) {
    BotToast.showText(
      text: msg,
      duration: Duration(milliseconds: isLongTime ? 2500 : 1500),
    );
  }

  ///获取本地资源图片
  static String getImage(String imageName, {String format = 'png'}) {
    return "assets/images/$imageName.$format";
  }

  static bool isLoadingDialog = false;

  /// 隐藏 Dialog
  static void disMissLoadingDialog() {
    isLoadingDialog = false;

    BotToast.closeAllLoading();
  }

  /// 显示Loading
  static void showLoading({String loadText = "loading..."}) {
    isLoadingDialog = true;

    BotToast.showLoading();
    // BotToast.showCustomLoading(toastBuilder: (cancelFunc) {
    //   return LoadingWidget(
    //     outsideDismiss: false,
    //     loadingText: loadText,
    //   );
    // });
  }

  //Dialog 封装
  static void showAlertDialog(
    BuildContext context,
    String contentText, {
    Function? confirmCallback,
    Function? dismissCallback,
    String confirmText = "确定",
    String cancelText = "取消",
    String title = "提示",
    bool isShowCancel = true,
    bool isAutoClose = true,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          child: AlertDialog(
            title: Text(title),
            content: Text(contentText),
            actions: <Widget>[
              Offstage(
                offstage: !isShowCancel,
                child: TextButton(
                  child: Text(cancelText, style: const TextStyle(color: Colors.black)),
                  onPressed: () {
                    if (isAutoClose) Navigator.of(context).pop();

                    if (dismissCallback != null) {
                      dismissCallback();
                    }
                  },
                ),
              ),
              TextButton(
                child: Text(confirmText, style: const TextStyle(color: Colors.black)),
                onPressed: () {
                  if (isAutoClose) Navigator.of(context).pop();

                  if (confirmCallback != null) {
                    confirmCallback();
                  }
                },
              )
            ],
            elevation: 20, //阴影
          ),
          onWillPop: () async {
            return Future.value(isAutoClose);
          },
        );
      },
    );
  }

  ///递归方式删除目录
  static Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }

  /**
   * 比较APP版本号的大小
   * <p>
   * 1、前者大则返回一个正数
   * 2、后者大返回一个负数
   * 3、相等则返回0
   *
   * @param version1 app版本号
   * @param version2 app版本号
   * @return int
   */
  static int compareAppVersion(String version1, String version2) {
    // 注意此处为正则匹配，不能用.
    List<String> versionArray1 = version1.split("\\.");
    List<String> versionArray2 = version2.split("\\.");
    int idx = 0;
    // 取数组最小长度值
    int minLength = min(versionArray1.length, versionArray2.length);
    int diff = 0;
    // 先比较长度，再比较字符
    while (idx < minLength &&
        (diff = versionArray1[idx].length - versionArray2[idx].length) == 0 &&
        (diff = versionArray1[idx].compareTo(versionArray2[idx])) == 0) {
      ++idx;
    }
    // 如果已经分出大小，则直接返回，如果未分出大小，则再比较位数，有子版本的为大
    diff = (diff != 0) ? diff : versionArray1.length - versionArray2.length;
    return diff;
  }

  /// 列表转字符串
  static String listToStr(List? list) {
    if (list == null || list.isEmpty) return "";

    StringBuffer stringBuffer = StringBuffer();
    list.forEach((it) {
      stringBuffer.write(it);
      stringBuffer.write(", ");
    });
    return stringBuffer.toString();
  }

  /// 获取文件的后缀名
  static String getPathSuffixName(String path) {
    return path.substring(path.lastIndexOf(".") + 1);
  }

  /// 获取文件名
  static String getPathFileName(String path) {
    return path.substring(path.lastIndexOf("/") + 1);
  }

  /// 获取指定的随机数
  static int random(int start, int end) {
    Random random = Random();
    return random.nextInt(end) % (end - start + 1) + start;
  }

  /// 随机获取一个颜色
  static Color randomColor({double a = 1}) {
    Random random = Random();
    return Color.fromARGB(
      (a * 255).toInt(),
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}
