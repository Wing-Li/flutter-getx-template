import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyListWidget extends StatefulWidget {
  final String? title;
  final String content;
  final String imageName;
  final double? marginTop;

  const EmptyListWidget({
    Key? key,
    this.title,
    this.content = "No data",
    this.imageName = "l_emptypage_new",
    this.marginTop,
  }) : super(key: key);

  @override
  _EmptyListWidgetState createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.marginTop ?? 0.15.w),
        Image.asset(MyUtils.getImage(widget.imageName)),
        SizedBox(height: 12),
        MyUtils.isEmpty(widget.title)
            ? const SizedBox.shrink()
            : Text(
                widget.title!,
                style: MyTextStyles.textWhiteBold(16),
                textAlign: TextAlign.center,
              ),
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.only(left: 64, right: 64),
          child: Text(
            widget.content,
            style: MyTextStyles.textWhite(14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
