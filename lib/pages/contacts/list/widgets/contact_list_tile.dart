import 'package:flutter/material.dart';
import 'package:ramflux_app/shared/index.dart';

class ContactListTile extends StatefulWidget {
  final void Function() onTap;

  const ContactListTile({Key? key, required this.onTap}) : super(key: key);

  @override
  State<ContactListTile> createState() => _ContactListTileState();
}

class _ContactListTileState extends State<ContactListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 25,
      contentPadding:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
      leading: const AvatarWidget(
        'https://picsum.photos/50',
        radius: 25,
      ),
      title: const TextWidget.titleMedium(
        'Kieron Dotson',
        weight: FontWeight.w600,
      ),
      onTap: widget.onTap,
    );
  }
}
