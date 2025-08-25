import 'package:flutter/material.dart';
import 'package:flutter_getx_template/pages/splash/_view/splash_view.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.put(SplashLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isShowSplash.value
          ? SplashView(onContinuePressed: controller.onContinuePressed)
          : _buildSplashIcon(),
    );
  }

  Widget _buildSplashIcon() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Image.asset(
          MyUtils.getImage('login_apple'),
          width: 140,
          height: 140,
        ),
      ),
    );
  }
}
