import 'package:flutter/material.dart';

import '../index.dart';

/// 列表行 ListTile 替代版本
class ListTileWidget extends StatelessWidget {
  /// 标题
  final Widget? title;

  /// 子标题
  final Widget? subtitle;

  /// 描述
  final Widget? description;

  /// 左侧图标
  final Widget? leading;

  /// 左侧图标间距
  final double? leadingSpace;

  /// 右侧图标
  final List<Widget>? trailing;

  /// 分割线颜色
  final Color? separatorColor;

  /// padding 边框间距
  final EdgeInsetsGeometry? padding;

  /// cross 对齐方式
  final CrossAxisAlignment? crossAxisAlignment;

  /// 点击事件
  final GestureTapCallback? onTap;

  /// 长按事件
  final GestureLongPressCallback? onLongPress;

  const ListTileWidget({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.leading,
    this.leadingSpace,
    this.trailing,
    this.separatorColor = Colors.transparent,
    EdgeInsetsGeometry? padding,
    this.crossAxisAlignment,
    this.onTap,
    this.onLongPress,
  }) : padding = padding ?? EdgeInsets.zero;

  _buildView() {
    List<Widget> widgets = [];

    // 头部图标
    if (leading != null) {
      widgets.add(
        leading!.paddingRight(
          leadingSpace ?? AppSpace.iconTextSmall,
        ),
      );
    }

    // 标题/子标题/描述
    List<Widget> titles = [
      if (title != null) title!,
      if (subtitle != null) subtitle!,
      if (description != null) description!,
    ];
    MainAxisAlignment titleMainAxisAlignment = titles.length == 1
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween;
    widgets.add(
      titles
          .toColumn(
            mainAxisAlignment: titleMainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    );

    // 右侧图标
    if (trailing != null) {
      MainAxisAlignment trailingMainAxisAlignment = trailing?.length == 1
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween;
      widgets.add(
        trailing!.toColumn(
          mainAxisAlignment: trailingMainAxisAlignment,
        ),
      );
    }

    return <Widget>[
      widgets
          .toRow(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          )
          .padding(value: padding),
      Container(
        height: 1,
        color: separatorColor,
      ),
    ]
        .toColumn()
        .backgroundColor(Colors.transparent)
        .onTap(onTap)
        .onLongPress(onLongPress);
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
