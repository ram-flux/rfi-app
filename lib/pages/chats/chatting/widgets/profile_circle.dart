import 'package:flutter/material.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    super.key,
    required this.bottomPadding,
    this.imageUrl,
    this.profileCirclePadding,
    this.circleRadius,
    this.onTap,
    this.onLongPress,
  });

  /// Allow users to give  default bottom padding according to user case.
  final double bottomPadding;

  /// Allow user to pass image url of user's profile picture.
  final String? imageUrl;

  /// Allow user to set whole padding of profile circle view.
  final EdgeInsetsGeometry? profileCirclePadding;

  /// Allow user to set radius of circle avatar.
  final double? circleRadius;

  /// Allow user to do operation when user tap on profile circle.
  final VoidCallback? onTap;

  /// Allow user to do operation when user long press on profile circle.
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.0, right: 4.0, bottom: bottomPadding),
      child: InkWell(
        onLongPress: onLongPress,
        onTap: onTap,
        child: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(imageUrl ??
              'https://ui-avatars.com/api/?name=John+Doe&background=random&color=fff'),
        ),
      ),
    );
  }
}
