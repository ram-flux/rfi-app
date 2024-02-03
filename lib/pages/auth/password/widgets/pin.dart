import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ramflux_app/shared/index.dart';

/// pin 输入框
class PinPutWidget extends StatelessWidget {
  /// 提交事件
  final Function(String)? onSubmit;

  /// 改变事件
  final Function(String)? onChanged;

  /// 焦点
  final FocusNode? focusNode;

  /// 文本编辑控制器
  final TextEditingController? controller;

  /// 验证函数
  final String? Function(String?)? validator;

  /// 长度
  final int? length;

  const PinPutWidget({
    super.key,
    this.onSubmit,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.validator,
    this.length,
  });

  @override
  Widget build(BuildContext context) {
    // 默认
    final defaultPinTheme = PinTheme(
      width: 47,
      height: 47,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.surfaceVariant),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(5),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.surfaceVariant,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: length ?? 4, // 长度
      validator: validator, // 验证函数
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true, // 显示光标
      autofocus: true, // 自动焦点
      obscureText: true, // 密码显示
      keyboardAppearance: Brightness.light,
      focusNode: focusNode, // 焦点
      controller: controller, // 本文控制器
      onCompleted: onSubmit, // 提交
      onChanged: onChanged,
    );
  }
}
