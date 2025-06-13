import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'my_appbar.dart';

class MyScaffold extends Scaffold {
  MyScaffold({
    String? title,
    PreferredSizeWidget? appBar,
    required Widget body,
    List<Widget>? actions,
    AppBarBackType? leadType,
    WillPopCallback? onWillPop,
    Brightness brightness = Brightness.light,
    Widget? floatingActionButton,
    Color appBarBackgroundColor = Colors.white,
    Color? titleColor,
    bool centerTitle = true,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) : super(
          appBar: appBar,
          backgroundColor: MyTheme.bg_page,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        );
}
