import 'package:flutter/material.dart';
import 'package:ramflux_app/shared/index.dart';

class ContactListTile extends StatefulWidget {
  final void Function() onTap;

  const ContactListTile({super.key, required this.onTap});

  @override
  State<ContactListTile> createState() => _ContactListTileState();
}

class _ContactListTileState extends State<ContactListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 18,
      contentPadding:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
      leading: const AvatarWidget(
        'https://picsum.photos/50',
        radius: 20,
      ),
      title: const TextWidget.titleSmall(
        'Kieron Dotson',
        weight: FontWeight.w500,
      ),
      onTap: widget.onTap,
    );
  }
}
