import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String? iconSvg;
  final int badgeCount;
  final IconData? iconData;

  NavigationItemModel({
    required this.label,
    this.iconSvg,
    this.badgeCount = 0,
    this.iconData,
  });
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex) ? AppColors.primary : null;
      var item = items[i];
      ws.add(
        <Widget>[
          // 图标
          if (item.iconData != null)
            IconWidget.icon(
              item.iconData,
              size: 26,
              color: color,
              badgeString:
                  item.badgeCount > 0 ? item.badgeCount.toString() : null,
            ).paddingBottom(2),
          if (item.iconSvg != null)
            IconWidget.svg(
              item.iconSvg,
              size: 26,
              color: color,
              badgeString:
                  item.badgeCount > 0 ? item.badgeCount.toString() : null,
            ).paddingBottom(2),
          // 文字
          TextWidget.bodyMedium(
            item.label.tr,
            color: color,
          ),
        ]
            .toColumn(
              mainAxisAlignment: MainAxisAlignment.center, // 居中
              mainAxisSize: MainAxisSize.max, // 最大
            )
            .onTap(() => onTap(i))
            .expanded(),
      );
    }
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: BottomAppBar(
          color: AppColors.surface.withOpacity(0.2),
          elevation: 0,
          child: ws
              .toRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              )
              .height(kBottomNavigationBarHeight),
        ),
      ),
    );
  }
}
