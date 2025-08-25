import 'package:flutter/material.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_getx_template/services/user_service.dart';
import 'package:flutter_getx_template/widget/layout/my_scaffold.dart';
import 'package:flutter_getx_template/widget/my_button.dart';
import 'package:get/get.dart';

import 'me_logic.dart';
import 'me_state.dart';

class MePage extends StatelessWidget {
  MePage({Key? key}) : super(key: key);

  final MeLogic logic = Get.put(MeLogic());
  final MeState state = Get.find<MeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return MyHomeScaffold(
      title: "Me",
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Me"),
            SizedBox(height: 20),
            MyButton(
              text: "Logout",
              width: 120,
              height: 42,
              borderRadius: 8,
              onPressed: () {
                UserService.to.logout();

                Get.offAllNamed(AppRoutes.Login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
