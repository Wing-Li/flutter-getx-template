import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

class SplashLogic extends GetxController {
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
    await Future.delayed(Duration(milliseconds: 1500), () {
      Get.offAllNamed(AppRoutes.Login);
    });
  }
}
