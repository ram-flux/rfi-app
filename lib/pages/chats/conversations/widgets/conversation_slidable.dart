import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class ConversationSlidableWidget extends StatefulWidget {
  /// The child of the Slidable
  final Widget child;

  final void Function(BuildContext) onNotShownPressed;

  final void Function(BuildContext) onMutePressed;

  final void Function(BuildContext) onDeletePressed;

  final void Function(BuildContext) onArchivePressed;

  final void Function(BuildContext) onAddMenuPressed;

  final void Function(BuildContext) onPinPressed;

  const ConversationSlidableWidget({
    super.key,
    required this.child,
    required this.onNotShownPressed,
    required this.onMutePressed,
    required this.onDeletePressed,
    required this.onArchivePressed,
    required this.onAddMenuPressed,
    required this.onPinPressed,
  });

  @override
  State<ConversationSlidableWidget> createState() => _SlidableState();
}

class _SlidableState extends State<ConversationSlidableWidget> {
  final Rx<bool> _isNotShownConfirmed = false.obs;
  final Rx<bool> _isDeleteConfirmed = false.obs;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 0);
    final Color foregroundColor = AppColors.onPrimary;

    return Obx(
      () => Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),
          // The extentRatio is the part of the child that will be visible
          extentRatio: 0.4,

          // All actions are defined in the children parameter.
          children: [
            SlidableAction(
              onPressed: widget.onAddMenuPressed,
              backgroundColor: AppColors.actionColors.addMenu!,
              foregroundColor: foregroundColor,
              icon: Icons.library_add_outlined,
              label: LocaleKeys.commonActionAddMenu.tr,
              padding: padding,
            ),
            SlidableAction(
              onPressed: widget.onPinPressed,
              backgroundColor: AppColors.actionColors.pin!,
              foregroundColor: foregroundColor,
              icon: Icons.push_pin_outlined,
              label: LocaleKeys.commonActionPin.tr,
              padding: padding,
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.8,
          children: [
            if (_isNotShownConfirmed.value || _isDeleteConfirmed.value)
              // 取消
              SlidableAction(
                onPressed: (context) {
                  _isNotShownConfirmed.value = false;
                  _isDeleteConfirmed.value = false;
                },
                backgroundColor: AppColors.secondary,
                foregroundColor: foregroundColor,
                icon: Icons.cancel_outlined,
                label: LocaleKeys.commonActionCancel.tr,
                padding: padding,
              ),
            // 不显示、确认不显示
            if (!_isDeleteConfirmed.value)
              SlidableAction(
                flex: _isNotShownConfirmed.value ? 3 : 1,
                onPressed: (context) {
                  if (_isNotShownConfirmed.value) {
                    _isNotShownConfirmed.value = false;
                    widget.onNotShownPressed(context);
                  } else {
                    _isNotShownConfirmed.value = true;
                  }
                },
                backgroundColor: AppColors.actionColors.notShown!,
                foregroundColor: foregroundColor,
                icon: Icons.visibility_off_outlined,
                label: _isNotShownConfirmed.value
                    ? LocaleKeys.commonActionNotShownConfirm.tr
                    : LocaleKeys.commonActionNotShown.tr,
                padding: padding,
                autoClose: _isNotShownConfirmed.value,
              ),
            // 静音
            if (!_isNotShownConfirmed.value && !_isDeleteConfirmed.value)
              SlidableAction(
                onPressed: widget.onMutePressed,
                backgroundColor: AppColors.actionColors.mute!,
                foregroundColor: foregroundColor,
                icon: Icons.volume_off_outlined,
                label: LocaleKeys.commonActionMute.tr,
                padding: padding,
              ),
            // 删除、确认删除
            if (!_isNotShownConfirmed.value)
              SlidableAction(
                flex: _isDeleteConfirmed.value ? 3 : 1,
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
            // 归档
            if (!_isNotShownConfirmed.value && !_isDeleteConfirmed.value)
              SlidableAction(
                onPressed: widget.onArchivePressed,
                backgroundColor: AppColors.actionColors.archive!,
                foregroundColor: foregroundColor,
                icon: Icons.archive_outlined,
                label: LocaleKeys.commonActionArchive.tr,
                padding: padding,
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
