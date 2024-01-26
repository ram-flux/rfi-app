import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import 'package:ramflux_app/shared/index.dart';

class ConversationListTile extends StatefulWidget {
  final void Function() onTap;

  const ConversationListTile({Key? key, required this.onTap}) : super(key: key);

  @override
  State<ConversationListTile> createState() => _ConversationListTileState();
}

class _ConversationListTileState extends State<ConversationListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      leading: const AvatarWidget('https://picsum.photos/60'),
      title: <Widget>[
        const TextWidget.titleMedium(
          'Pixsellz Team',
          weight: FontWeight.w600,
        ).marginOnly(right: 6),
        IconWidget.svg(AssetsIcons.muteSmallIconSvg, size: 12),
      ].toRow(),
      subtitle: <Widget>[
        TextWidget.titleSmall(
          '👋🏻 IOS 13 Design Kit.',
          color: AppColors.onSecondary,
        ),
        const TextWidget.bodyLarge(
          'Hello, I am from Pixsellz Team and we are here to help you.',
          overflow: TextOverflow.ellipsis,
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      trailing: <Widget>[
        <Widget>[
          IconWidget.svg(
            AssetsIcons.readSmallIconSvg,
            width: 16,
            height: 10,
          ).marginOnly(right: 6),
          TextWidget.bodyMedium(
            '10:00',
            color: AppColors.secondary,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.end),
        <Widget>[
          badges.Badge(
            badgeContent: TextWidget.bodyMedium(
              '9',
              color: AppColors.onPrimary,
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: AppColors.primary,
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.circular(10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0.6),
            ),
          ).marginOnly(right: 6),
          IconWidget.svg(
            AssetsIcons.pinSmallIconSvg,
            size: 20,
          ).marginOnly(right: 6),
        ].toRow(mainAxisAlignment: MainAxisAlignment.end),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
          )
          .constrained(width: 68),
      onTap: widget.onTap,
    );
  }
}
