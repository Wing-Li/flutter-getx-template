import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final String loadingText;
  final bool outsideDismiss;

  final Function? dismissDialog;

  const LoadingWidget({
    Key? key,
    this.loadingText = "loading...",
    this.outsideDismiss = true,
    this.dismissDialog,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.dismissDialog != null) {
      widget.dismissDialog!(() {
        /// 将关闭 Loading 的方法传递到调用的页面.
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.outsideDismiss ? _dismissLoading : null,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      ),
    );
  }

  //关闭 loading
  _dismissLoading() {
    Navigator.of(context).pop();
  }
}
