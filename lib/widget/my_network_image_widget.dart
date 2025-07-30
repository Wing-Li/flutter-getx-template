import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';
import 'package:octo_image/octo_image.dart';

//# 图片加载
//octo_image: ^0.3.0
//cached_network_image: ^2.5.0

class MyNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? placeholderPath;
  final Widget? placeholderWidget;
  final bool isRound;

  const MyNetworkImage(
    this.url, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderPath,
    this.placeholderWidget,
    this.isRound = false,
  }) : super(key: key);

  /// 占位图
  _placeholderWidget() {
    if (!MyUtils.isEmpty(this.placeholderPath))
      return Image.asset(
        MyUtils.getImage(this.placeholderPath!),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      );

    if (this.placeholderWidget != null) {
      return placeholderWidget;
    } else {
      return Container(
        color: MyTheme.bg_gray_tran,
        child: Center(
          child: Image.asset(
            MyUtils.getImage("l_image_loading_bg"),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Container(
      width: this.width,
      height: this.height,
      child: OctoImage(
        width: double.infinity,
        height: double.infinity,
        image: CachedNetworkImageProvider(this.url, cacheManager: DefaultCacheManager()),
        // image: NetworkImage(this.url),
        // placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
        placeholderBuilder: (context) => _placeholderWidget(),
        errorBuilder: (context, o, s) => _placeholderWidget(),
        fit: this.fit,
      ),
    );

    if (this.isRound) {
      return ClipOval(child: image);
    } else {
      return image;
    }
  }
}
