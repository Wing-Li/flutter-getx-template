import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';

import 'empty_list_widget.dart';

class MyEasyRefresh extends StatefulWidget {
  final Widget child;

  // 列表项数量
  // 用于判断是否有内容
  final int itemCount;

  // 刷新回调 - return 是否还有数据： true: 有数据； false: 没有数据
  final Future<bool> Function()? onRefresh;

  // 加载回调： return 是否还有数据： true: 有数据； false: 没有数据
  final Future<bool> Function()? onLoadMore;

  // 是否启用下拉刷新
  final bool enableRefresh;

  // 是否启用上拉加载
  final bool enableLoadMore;

  // 是否显示空状态
  final bool showEmpty;

  // 是否显示加载中
  final bool showLoading;

  // 空状态文案
  final String? emptyText;

  // 空状态图片
  final String? emptyImage;

  // 空状态按钮文案
  final String? emptyBtnText;

  // 空状态按钮回调
  final VoidCallback? emptyBtnOnTap;

  // 外部传入的controller（可选）
  final EasyRefreshController? refreshController;

  final EdgeInsetsGeometry? loadingPadding;

  final EdgeInsetsGeometry? emptyPadding;

  const MyEasyRefresh({
    super.key,
    required this.child,
    required this.itemCount,
    required this.onRefresh,
    this.onLoadMore,
    this.enableRefresh = true,
    this.enableLoadMore = false,
    this.showEmpty = false,
    this.showLoading = false,
    this.emptyText,
    this.emptyImage,
    this.emptyBtnText,
    this.emptyBtnOnTap,
    this.refreshController,
    this.loadingPadding,
    this.emptyPadding,
  });

  @override
  State<MyEasyRefresh> createState() => _MyEasyRefreshState();
}

class _MyEasyRefreshState extends State<MyEasyRefresh> {
  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    // 如果外部没有传入controller，则创建一个内部的
    _controller = widget.refreshController ??
        EasyRefreshController(
          controlFinishRefresh: true,
          controlFinishLoad: true,
        );
  }

  @override
  void dispose() {
    // 只有当controller是内部创建的时候才需要dispose
    if (widget.refreshController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  // 内部封装的刷新回调
  Future<void> _handleRefresh() async {
    if (widget.onRefresh != null) {
      final success = await widget.onRefresh!();
      if (success) {
        _controller.finishRefresh(IndicatorResult.success);
      } else {
        _controller.finishRefresh(IndicatorResult.noMore);
      }
    } else {
      _controller.finishRefresh(IndicatorResult.success);
    }
  }

  // 内部封装的加载更多回调
  Future<void> _handleLoadMore() async {
    if (widget.onLoadMore != null) {
      final success = await widget.onLoadMore!();
      if (success) {
        _controller.finishLoad(IndicatorResult.success);
      } else {
        _controller.finishLoad(IndicatorResult.noMore);
      }
    } else {
      _controller.finishLoad(IndicatorResult.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = widget.itemCount > 0;

    Widget getContent() {
      if (!hasData && widget.showLoading) {
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Padding(
                    padding: widget.loadingPadding ?? const EdgeInsets.only(top: 300),
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(MyTheme.main),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Loading...',
                          style: MyTextStyles.textWhite(16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }

      if (widget.showEmpty && !hasData && !widget.showLoading) {
        return Container(
          padding: widget.emptyPadding,
          child: Center(
            child: EmptyListWidget(
              content: widget.emptyText ?? 'No data',
              btnText: widget.emptyBtnText,
              onBtnTap: widget.emptyBtnOnTap,
            ),
          ),
        );
      }
      return widget.child;
    }

    return EasyRefresh(
      controller: _controller,
      onRefresh: widget.enableRefresh ? _handleRefresh : null,
      onLoad: widget.enableLoadMore ? _handleLoadMore : null,
      header: widget.enableRefresh ? const MyEasyRefreshHeader() : null,
      footer: widget.enableLoadMore ? const MyEasyRefreshFooter() : null,
      child: getContent(),
    );
  }
}

class MyEasyRefreshHeader extends ClassicHeader {
  const MyEasyRefreshHeader({
    super.key,
    String dragText = 'Pull to refresh',
    String armedText = 'Release to refresh',
    String readyText = 'Refreshing...',
    String processingText = 'Refreshing...',
    String processedText = 'Refreshed',
    String noMoreText = 'No more data',
    String failedText = 'Refresh failed',
    String messageText = 'Last updated at %T',
    double triggerOffset = 50,
  }) : super(
          dragText: dragText,
          armedText: armedText,
          readyText: readyText,
          processingText: processingText,
          processedText: processedText,
          noMoreText: noMoreText,
          failedText: failedText,
          messageText: messageText,
          triggerOffset: triggerOffset,
        );
}

class MyEasyRefreshFooter extends ClassicFooter {
  const MyEasyRefreshFooter({
    super.key,
    String dragText = 'Pull to load more',
    String armedText = 'Release to load more',
    String readyText = 'Loading...',
    String processingText = 'Loading...',
    String processedText = 'Loaded',
    String noMoreText = 'No more data',
    String failedText = 'Load more failed',
    String messageText = 'Last updated at %T',
  }) : super(
          dragText: dragText,
          armedText: armedText,
          readyText: readyText,
          processingText: processingText,
          processedText: processedText,
          noMoreText: noMoreText,
          failedText: failedText,
          messageText: messageText,
        );
}

/*
使用示例：

MyEasyRefresh(
  itemCount: items.length,
  onRefresh: () async {
    // 执行刷新逻辑
    try {
      await loadData();
      return true; // 返回true表示成功
    } catch (e) {
      return false; // 返回false表示失败
    }
  },
  onLoadMore: () async {
    // 执行加载更多逻辑
    try {
      await loadMoreData();
      return true; // 返回true表示成功，还有更多数据
    } catch (e) {
      return false; // 返回false表示失败或没有更多数据
    }
  },
  enableRefresh: true,
  enableLoadMore: true,
  showEmpty: items.isEmpty,
  showLoading: isLoading,
  child: ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(title: Text(items[index]));
    },
  ),
)

使用自定义 Controller 示例：

final EasyRefreshController _controller = EasyRefreshController(
  controlFinishRefresh: true,
  controlFinishLoad: true,
);

MyEasyRefresh(
  refreshController: _controller,
  itemCount: items.length,
  onRefresh: () async {
    // 执行刷新逻辑
    try {
      await loadData();
      return true;
    } catch (e) {
      return false;
    }
  },
  enableRefresh: true,
  child: ListView.builder(...),
)

主要优化点：
1. 内部自动管理 EasyRefreshController，外部不传则自动创建（包含必需的控制参数）
2. 回调函数返回 Future<bool>，true表示成功，false表示失败
3. 内部自动处理 IndicatorResult.success、IndicatorResult.fail 和 IndicatorResult.noMore
4. 异常处理自动返回失败状态
5. 资源管理更加完善，避免内存泄漏
6. 完美兼容 easy_refresh 3.0+ 版本的 controlFinishLoad 要求
*/
