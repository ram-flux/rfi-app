import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class ContactSlidableWidget extends StatefulWidget {
  /// The child of the Slidable
  final Widget child;

  final void Function(BuildContext) onDeletePressed;

  const ContactSlidableWidget({
    super.key,
    required this.child,
    required this.onDeletePressed,
  });

  @override
  State<ContactSlidableWidget> createState() => _SlidableState();
}

class _SlidableState extends State<ContactSlidableWidget> {
  final Rx<bool> _isDeleteConfirmed = false.obs;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 0);
    final Color foregroundColor = AppColors.onPrimary;

    return Obx(
      () => Slidable(
        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.4,
          children: [
            if (_isDeleteConfirmed.value)
              // 取消
              SlidableAction(
                onPressed: (context) {
                  _isDeleteConfirmed.value = false;
                },
                backgroundColor: AppColors.secondary,
                foregroundColor: foregroundColor,
                icon: Icons.cancel_outlined,
                label: LocaleKeys.commonActionCancel.tr,
                padding: padding,
              ),
            // 删除、确认删除
            SlidableAction(
              flex: _isDeleteConfirmed.value ? 2 : 1,
              onPressed: (context) {
                if (_isDeleteConfirmed.value) {
                  _isDeleteConfirmed.value = false;
                  widget.onDeletePressed(context);
                } else {
                  _isDeleteConfirmed.value = true;
                }
              },
              backgroundColor: AppColors.actionColors.delete!,
              foregroundColor: foregroundColor,
              icon: Icons.delete_outline,
              label: _isDeleteConfirmed.value
                  ? LocaleKeys.commonActionDeleteConfirm.tr
                  : LocaleKeys.commonActionDelete.tr,
              padding: padding,
              autoClose: _isDeleteConfirmed.value,
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: widget.child,
      ),
    );
  }
}
