import 'package:flutter/material.dart';
import 'package:flutter_getx_template/widget/layout/my_app_bar.dart';

class MyScaffold extends StatelessWidget {
  final Widget? body;

  const MyScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}

class MyHomeScaffold extends StatelessWidget {
  final String title;
  final Widget? body;

  const MyHomeScaffold({super.key, required this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: MyTitle(title),
            ),
            Expanded(
              child: body ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
