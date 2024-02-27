import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';

line({double? height}) {
  return Container(height: height ?? 1, color: MyTheme.line);
}

/// 单行文本显示
itemTextValue(
  String title,
  String value, {
  Color? valueColor,
  double fontSize = 16,
}) {
  return Container(
    constraints: BoxConstraints(
      minHeight: 48,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(title, style: MyTextStyles.textBlock(fontSize)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: MyTextStyles.text(fontSize, color: valueColor ?? MyTheme.bg_block_tran),
          ),
        )
      ],
    ),
  );
}

/// 多行文本显示
itemMultilineTextValue(String title, String value) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: MyTextStyles.textBlock(16)),
        const SizedBox(height: 8),
        Text(value, style: MyTextStyles.textGrayDeep(14)),
      ],
    ),
  );
}

/// 列表台账显示
Widget itemStandingBook(
  String text1,
  String? text2,
  String? text3, {
  int index = 1,
  Color? bgColor,
  bool isTextBold = false,
  int? flex1 = 3,
  int? flex2 = 2,
  int? flex3 = 4,
}) {
  _itemText(String text, {bool isBold = false}) {
    return Text(
      text,
      style: MyTextStyles.textBold(15),
      textAlign: TextAlign.center,
    );
  }

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    color: bgColor ?? (index % 2 == 1 ? MyTheme.transparent : MyTheme.bg_gray_tran),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: _itemText(text1, isBold: isTextBold),
        ),
        if (text2 != null)
          Expanded(
            flex: 2,
            child: _itemText(text2, isBold: isTextBold),
          ),
        if (text3 != null)
          Expanded(
            flex: 4,
            child: _itemText(text3, isBold: isTextBold),
          ),
      ],
    ),
  );
}

/// 左边标题，右边列表显示
itemTextListValue(
  String title,
  List<String> values, {
  Color? valueColor,
  double titleSize = 16,
  double fontSize = 13,
}) {
  return Container(
    constraints: BoxConstraints(
      minHeight: 48,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(title, style: MyTextStyles.textBlock(titleSize)),
        const SizedBox(width: 8),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: values
                .map((e) => SizedBox(
                      height: 22,
                      child: Text(
                        e,
                        textAlign: TextAlign.end,
                        style: MyTextStyles.text(fontSize, color: valueColor ?? MyTheme.text_block_gray_deep),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    ),
  );
}

itemSingeRadio(String title, List<String> listData, String selectText, Function(String?) onChanged) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(title, style: MyTextStyles.textBlock(16)),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listData
                .map(
                  (e) => SizedBox(
                    height: 34,
                    child: RadioMenuButton(
                      value: e,
                      groupValue: selectText,
                      clipBehavior: Clip.hardEdge,
                      onChanged: onChanged,
                      child: Text(e),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}
