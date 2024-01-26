import 'package:flutter/material.dart';

import '../index.dart';

/// 主导航栏
AppBar mainAppBarWidget({
  Key? key,
  Widget? leading, // 左侧按钮
  List<Widget>? actions, // 右侧按钮组
  String? titleString, // 标题
  double? titleSpace, // 标题间距
  double? iconSize, // 图标大小
  Color? backgroundColor, // 背景色
  Function()? onTap, // 点击事件
}) {
  return AppBar(
    // 最左侧按钮
    leading: leading,

    // 按钮和标题组件间距
    titleSpacing: titleSpace,

    // 标题组件
    centerTitle: true,
    title: titleString != null ? TextWidget.navigation(titleString) : null,

    // 右侧按钮组
    actions: actions,

    // 背景色
    backgroundColor: backgroundColor ?? AppColors.primaryContainer,
  );
}
