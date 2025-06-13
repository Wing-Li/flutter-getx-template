import 'package:flutter/material.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route not found"),
      ),
      body: Center(
        child: ListTile(
          title: Text("Go back home"),
          subtitle: Text('Go back home'),
          onTap: () => Get.offAllNamed(AppRoutes.Main),
        ),
      ),
    );
  }
}
