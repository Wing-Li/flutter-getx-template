import 'package:flutter/material.dart';
import 'package:flutter_getx_template/pages/login/login_logic.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginLogic> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoutes.Main),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('登录页', style: MyTextStyles.title(32, color: MyTheme.block)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.offAndToNamed(AppRoutes.Main),
                  child: Text('去首页'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
