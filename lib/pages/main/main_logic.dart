import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat/chat_view.dart';
import 'home/home_view.dart';
import 'me/me_view.dart';
import 'news/news_view.dart';

class TabItem {
  final String title;
  final String iconName;
  final Widget page;

  TabItem(this.title, this.iconName, this.page);
}

class MainLogic extends GetxController {
  final List<TabItem> tabs = [];
  final List<Widget> pages = [];
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    init();
  }

  void init() {
    tabs.add(TabItem('home'.tr, 'l_global_icon_wholike', HomePage()));
    tabs.add(TabItem('news'.tr, 'l_global_icon_discover', NewsPage()));
    tabs.add(TabItem('friends'.tr, 'l_global_icon_chat', ChatPage()));
    tabs.add(TabItem('me'.tr, 'l_global_icon_me', MePage()));

    pages.addAll(tabs.map((e) => e.page).toList());
  }

  gotoPage(int page) {
    currentIndex.value = page;
  }
}
