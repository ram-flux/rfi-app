import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class PopupMenuButtonItem {
  const PopupMenuButtonItem({
    required this.text,
    required this.imageUrl,
    required this.value,
  });

  final String value;
  final String text;
  final String imageUrl;
}

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({
    super.key,
    required this.icon,
    required this.items,
    required this.onSelected,
  });

  final Widget icon;
  final List<PopupMenuButtonItem> items;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: icon,
      onSelected: onSelected,
      offset: const Offset(0, 50),
      itemBuilder: (BuildContext context) {
        return items.map((PopupMenuButtonItem item) {
          return PopupMenuItem<String>(
            value: item.value,
            height: 40,
            child: Row(
              children: <Widget>[
                IconWidget.svg(
                  item.imageUrl,
                  width: 20,
                  height: 20,
                  color: AppColors.onSecondary,
                ).marginOnly(right: 10),
                TextWidget.bodyMedium(
                  item.text,
                  color: AppColors.onSecondary,
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
