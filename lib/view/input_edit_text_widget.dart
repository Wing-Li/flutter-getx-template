import 'package:flutter/material.dart';
import 'package:flutter_getx_template/res/my_styles.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/utils/my_utils.dart';

class InputEditTextWidget extends StatefulWidget {
  final String? title;
  final String inputText;
  final String hintText;
  final int? maxLength;
  final bool isEnabled;
  final bool isShowClearIcon;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final Function(String)? onChangedTap;
  final Function(String)? onSubmittedTap;
  final Function? onClearTap;

  const InputEditTextWidget({
    Key? key,
    this.title,
    this.inputText = "",
    this.hintText = "请输入...",
    this.isEnabled = true,
    this.focusNode,
    this.onChangedTap,
    this.onSubmittedTap,
    this.onClearTap,
    this.isShowClearIcon = true,
    this.maxLength,
    this.keyboardType = TextInputType.number,
  }) : super(key: key);

  @override
  _InputEditTextWidgetState createState() => _InputEditTextWidgetState();
}

class _InputEditTextWidgetState extends State<InputEditTextWidget> {
  String _inputText = "";

  @override
  void initState() {
    _inputText = widget.inputText;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InputEditTextWidget oldWidget) {
    _inputText = widget.inputText;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!MyUtils.isEmpty(widget.inputText)) _inputText = widget.inputText;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 44,
      decoration: BoxDecoration(
        color: MyTheme.bg_page,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 12),
          Container(
            width: 70,
            child: Text(widget.title ?? "请输入", style: MyTextStyles.textGrayDeep(14)),
          ),
          Expanded(
            child: Container(
              child: TextField(
                focusNode: widget.focusNode,
                minLines: 1,
                maxLines: 1,
                maxLength: widget.maxLength,
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: _inputText,
                    selection: TextSelection.fromPosition(
                      TextPosition(affinity: TextAffinity.downstream, offset: _inputText.length),
                    ),
                  ),
                ),
                enabled: widget.isEnabled,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  // contentPadding: EdgeInsets.all(0),
                  hintText: widget.hintText,
                  hintStyle: MyTextStyles.textGrayDeep(14),
                  labelStyle: MyTextStyles.textGrayDeep(12),
                ),
                keyboardType: widget.keyboardType,
                onChanged: (value) {
                  _inputText = value;
                  if (widget.onChangedTap != null) widget.onChangedTap!(value);
                },
                // onAppPrivateCommand: (value, map) {
                //   if (widget.onSubmittedTap != null) widget.onSubmittedTap(value);
                // },
                onSubmitted: (value) {
                  if (widget.onSubmittedTap != null) widget.onSubmittedTap!(value);
                },
              ),
            ),
          ),
          SizedBox(width: 6),
          Offstage(
            offstage: !widget.isShowClearIcon,
            child: GestureDetector(
              child: Container(
                width: 48,
                height: 48,
                child: Icon(Icons.close, color: MyTheme.text_block_gray_light),
              ),
              onTap: () {
                setState(() {
                  _inputText = "";
                });

                if (widget.onClearTap != null) widget.onClearTap!();
              },
            ),
          ),
        ],
      ),
    );
  }
}
