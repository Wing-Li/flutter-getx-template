import 'package:get/get.dart';

import 'me_logic.dart';

class MeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeLogic());
  }
}
