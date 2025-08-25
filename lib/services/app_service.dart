import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  List<String> openedRoutes = [];
  List<Route> routeTree = [];

  /// ============ 添加/移除路由 ============

  /// 添加路由
  void addRoute(Route route) {
    openedRoutes.add(route.settings.name!);
    routeTree.add(route);
  }

  void removeRoute(Route route) {
    openedRoutes.remove(route.settings.name!);
    routeTree.remove(route);
  }

  /// ============ 路由操作 ============

  // 检查是否打开指定 name
  bool isOpened(String name) {
    return openedRoutes.contains(name);
  }

  // 通过 name 获取 route
  List<Route> getRoute(String name) {
    return routeTree.where((route) => route.settings.name == name).toList();
  }

  /// 关闭指定name的页面
  void closeRouteByName(String name) {
    List<Route> routes = getRoute(name);
    for (Route route in routes) {
      Get.removeRoute(route);
      openedRoutes.remove(name);
      routeTree.remove(route);
    }
  }
}
