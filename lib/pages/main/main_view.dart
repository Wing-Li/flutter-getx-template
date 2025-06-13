import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'main_logic.dart';
import 'main_state.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;

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
    return PageView(
      physics: NeverScrollableScrollPhysics(), //禁止滑动
      controller: logic.pageController,
      children: state.pages,
    );
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
            color: state.currentIndex.value == index
                ? MyTheme.bg_tab_active
                : null,
            borderRadius: BorderRadius.circular(50.w),
          ),
          alignment: Alignment.center,
          child: Opacity(
            opacity: state.currentIndex.value == index ? 1 : 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MyUtils.getImage(state.tabs[index].iconName),
                  height: 24,
                  width: 24,
                  color:
                      state.currentIndex.value == index ? Colors.white : null,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(height: 2),
                Text(
                  state.tabs[index].title,
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
    if (state.currentIndex.value != index) {
      logic.gotoPage(index);

      state.currentIndex.value = index;
    }
  }
}
