import 'package:get/get.dart';

import 'news_logic.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsLogic());
  }
}
