import 'package:flutter_getx_template/common/my_constants.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_getx_template/utils/sp_utils.dart';
import 'package:get/get.dart';

class SplashLogic extends GetxController {
  //
  var isShowSplash = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    startCountdownTimer();
  }

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    bool isSplashPageShowed = SpUtils.getBool(MyConstants.STORAGE_SPLASH_PAGE_SHOWED);
    if (isSplashPageShowed) {
      Get.offAllNamed(AppRoutes.Main);
    } else {
      isShowSplash.value = true;
    }
  }

  void onContinuePressed() {
    SpUtils.putBool(MyConstants.STORAGE_SPLASH_PAGE_SHOWED, true);
    Get.offAllNamed(AppRoutes.Login, arguments: true);
  }
}
