import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();
  PageController pageController = new PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
  }

  gotoPage(int page) {
    pageController.jumpToPage(page);
  }

  setCurrentIndex(int index) {
    state.currentIndex.value = index;
  }
}
