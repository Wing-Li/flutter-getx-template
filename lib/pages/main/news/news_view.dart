import 'package:flutter/material.dart';
import 'package:flutter_getx_template/widget/layout/my_scaffold.dart';
import 'package:get/get.dart';

import 'news_logic.dart';
import 'news_state.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final NewsLogic logic = Get.put(NewsLogic());
  final NewsState state = Get.find<NewsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return MyHomeScaffold(
      title: "News",
      body: Center(
        child: Text("News"),
      ),
    );
  }
}
