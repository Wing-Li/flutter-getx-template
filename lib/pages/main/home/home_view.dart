import 'package:flutter/material.dart';
import 'package:flutter_getx_template/widget/layout/my_scaffold.dart';
import 'package:get/get.dart';

import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return MyHomeScaffold(
      title: "Home",
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
