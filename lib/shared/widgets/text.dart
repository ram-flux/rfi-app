import 'package:flutter/material.dart';

import '../index.dart';

/// 文字组件
class TextWidget extends StatelessWidget {
  /// 文字字符串
  final String text;

  /// 样式
  final TextStyle? style;

  /// 颜色
  final Color? color;

  /// 大小
  final double? size;

  /// 重量
  final FontWeight? weight;

  /// 行数
  final int? maxLines;

  /// 自动换行
  final bool? softWrap;

  /// 溢出
  final TextOverflow? overflow;

  /// 对齐方式
  final TextAlign? textAlign;

  const TextWidget({
    super.key,
    required this.text,
    this.style,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  });

  /// 文字 - 标题1
  const TextWidget.titleLarge(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        );

  /// 文字 - 标题2
  const TextWidget.titleMedium(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        );

  /// 文字 - 标题3
  const TextWidget.titleSmall(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );

  /// 文字 - 正文1
  const TextWidget.bodyLarge(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        );

  /// 文字 - 正文2
  const TextWidget.bodyMedium(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );

  /// 文字 - 正文3
  const TextWidget.bodySmall(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w300,
        );

  /// 文字 - 按钮
  TextWidget.button({
    super.key,
    required this.text,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    Color? color,
    this.size,
    this.weight,
    this.textAlign,
  })  : color = color ?? AppColors.secondary,
        style = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 1.0,
        );

  /// 文字 - 导航
  const TextWidget.navigation(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.clip,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  }) : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w100,
        );

  @override
  Widget build(BuildContext context) {
    if (text == "") {
      return const SizedBox();
    }
    return Text(
      text,
      style: style?.copyWith(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ) ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
          ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
    );
  }
}
