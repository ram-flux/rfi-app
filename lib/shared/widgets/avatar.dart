import 'package:flutter/material.dart';

enum AvatarWidgetType {
  url,
  asset,
}

// AvatarWidget 头像组件
class AvatarWidget extends StatelessWidget {
  const AvatarWidget(this.url,
      {super.key, this.type = AvatarWidgetType.url, this.radius});

  final String? url;
  final double? radius;
  final AvatarWidgetType type;

  const AvatarWidget.asset(
    this.url, {
    Key? key,
    this.type = AvatarWidgetType.asset,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider? image;
    if (type == AvatarWidgetType.asset) {
      image = AssetImage(url!);
    } else if (type == AvatarWidgetType.url) {
      image = NetworkImage(url!);
    }
    return CircleAvatar(
      radius: radius ?? 30,
      foregroundImage: image,
    );
  }
}
