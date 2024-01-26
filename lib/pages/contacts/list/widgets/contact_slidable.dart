import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class ContactSlidableWidget extends StatefulWidget {
  /// The child of the Slidable
  final Widget child;

  final void Function(BuildContext) onDeletePressed;

  const ContactSlidableWidget({
    Key? key,
    required this.child,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  State<ContactSlidableWidget> createState() => _SlidableState();
}

class _SlidableState extends State<ContactSlidableWidget> {
  bool isDeleteConfirmed = false;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 0);
    final Color foregroundColor = AppColors.onPrimary;

    return Slidable(
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.4,
        children: [
          if (isDeleteConfirmed)
            // 取消
            SlidableAction(
              onPressed: (context) {
                setState(() {
                  isDeleteConfirmed = false;
                });
              },
              backgroundColor: AppColors.secondary,
              foregroundColor: foregroundColor,
              icon: Icons.cancel_outlined,
              label: LocaleKeys.commonActionCancel.tr,
              padding: padding,
            ),
          // 删除、确认删除
          SlidableAction(
            flex: isDeleteConfirmed ? 2 : 1,
            onPressed: (context) {
              if (isDeleteConfirmed) {
                setState(() {
                  isDeleteConfirmed = false;
                });
                widget.onDeletePressed(context);
              } else {
                setState(() {
                  isDeleteConfirmed = true;
                });
              }
            },
            backgroundColor: AppColors.actionColors.delete!,
            foregroundColor: foregroundColor,
            icon: Icons.delete_outline,
            label: isDeleteConfirmed
                ? LocaleKeys.commonActionDeleteConfirm.tr
                : LocaleKeys.commonActionDelete.tr,
            padding: padding,
            autoClose: isDeleteConfirmed,
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: widget.child,
    );
  }
}
