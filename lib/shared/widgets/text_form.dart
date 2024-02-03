import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../index.dart';

class ThisWidget extends StatefulWidget {
  const ThisWidget({super.key});

  @override
  State<ThisWidget> createState() => _ThisWidgetState();
}

class _ThisWidgetState extends State<ThisWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// TextFormField 表单 输入框
class TextFormFieldWidget extends StatefulWidget {
  /// 控制器
  final TextEditingController? controller;

  /// 输入框样式
  final InputDecoration? decoration;

  /// 验证函数
  final String? Function(String?)? validator;

  /// 自动焦点
  final bool? autofocus;

  /// 标题
  final String? labelText;

  /// 必须输入
  final bool? isMustBeEnter;

  /// 是否密码
  final bool? isObscure;

  /// 是否显示密码按钮
  final bool? isShowObscureIcon;

  /// 是否只读
  final bool? readOnly;

  /// 输入法类型
  final TextInputType? keyboardType;

  /// 输入格式定义
  final List<TextInputFormatter>? inputFormatters;

  /// 提示文字
  final String? hintText;

  /// 圆角
  final double? borderRadius;

  /// 边框颜色
  final Color? borderColor;

  /// 点击事件
  final Function()? onTap;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.autofocus = false,
    this.labelText,
    this.isMustBeEnter = false,
    this.validator,
    this.isObscure = false,
    this.isShowObscureIcon = false,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.hintText,
    this.borderRadius,
    this.borderColor,
    this.onTap,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _isObscureText = false;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.isObscure!;
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = widget.decoration ??
        InputDecoration(
          hintText: widget.hintText, // 提示文字
          // 标题
          labelText: widget.isMustBeEnter == true
              ? "* ${widget.labelText}"
              : widget.labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.secondary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                widget.borderRadius ?? AppRadius.input,
              ),
            ),
          ),
          filled: false,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),
        );
    return TextFormField(
      onTap: widget.onTap, // 点击事件
      readOnly: widget.readOnly!, // 是否只读
      autofocus: widget.autofocus!, // 自动焦点
      keyboardType: widget.keyboardType, // 输入法类型
      controller: widget.controller, // 控制器
      decoration: decoration.copyWith(
        // 密码按钮
        suffixIcon: widget.isShowObscureIcon == true && widget.isObscure == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
                icon: Icon(
                  _isObscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 15,
                  color: AppColors.primary,
                ),
              )
            : null,
      ),
      // 校验
      validator: widget.validator,
      // 是否密码
      obscureText: _isObscureText,
      // 输入格式
      inputFormatters: widget.inputFormatters,
    );
  }
}
