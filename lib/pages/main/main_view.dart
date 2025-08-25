import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final MainLogic logic = Get.put(MainLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.bg_page,
      body: Column(children: [
        Expanded(
          child: _buildBody(),
        ),
        _buildBottomBar(),
      ]),
    );
  }

  Widget _buildBody() {
    return Obx(() => IndexedStack(
          index: logic.currentIndex.value,
          children: logic.pages,
        ));
  }

  Widget _buildBottomBar() {
    return Container(
      height: 58,
      margin: EdgeInsets.only(
        bottom: ScreenUtil().bottomBarHeight,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: MyTheme.bg_tab,
        borderRadius: BorderRadius.circular(58.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: _bottomItem(0)),
          Expanded(child: _bottomItem(1)),
          Expanded(child: _bottomItem(2)),
          Expanded(child: _bottomItem(3)),
        ],
      ),
    );
  }

  Widget _bottomItem(int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Obx(() {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: logic.currentIndex.value == index ? MyTheme.bg_tab_active : null,
            borderRadius: BorderRadius.circular(50.w),
          ),
          alignment: Alignment.center,
          child: Opacity(
            opacity: logic.currentIndex.value == index ? 1 : 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MyUtils.getImage(logic.tabs[index].iconName),
                  height: 24,
                  width: 24,
                  color: logic.currentIndex.value == index ? Colors.white : null,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(height: 2),
                Text(
                  logic.tabs[index].title,
                  style: MyTextStyles.textWhite(10),
                ),
              ],
            ),
          ),
        );
      }),
      onTap: () {
        _setTab(index);
      },
    );
  }

  _setTab(int index) {
    if (logic.currentIndex.value != index) {
      logic.gotoPage(index);
    }
  }
}
