import 'package:flutter/material.dart';
import 'package:ramflux_app/shared/index.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    this.trailing,
    this.avatarRadius = 20,
    this.padding = const EdgeInsetsDirectional.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  });

  final Widget? trailing;
  final double? avatarRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 18,
      contentPadding: padding,
      leading: AvatarWidget(
        'https://picsum.photos/30',
        radius: avatarRadius,
      ),
      title: const TextWidget.titleSmall(
        'Kieron Dotson',
        weight: FontWeight.w500,
      ),
      trailing: trailing ?? Container(),
    );
  }
}
