import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ConversationsController extends GetxController {
  ConversationsController();

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  void onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    refreshController.refreshCompleted();

    update(["conversations"]);
  }

  void onNotShownPressed(BuildContext context) {
    Get.snackbar(
      "onNotShownPressed",
      "onNotShownPressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  void onMutePressed(BuildContext context) {
    Get.snackbar(
      "onMutePressed",
      "onMutePressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  void onDeletePressed(BuildContext context) {
    Get.snackbar(
      "onDeletePressed",
      "onDeletePressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  void onArchivePressed(BuildContext context) {
    Get.snackbar(
      "onArchivePressed",
      "onArchivePressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  void onAddMenuPressed(BuildContext context) {
    Get.snackbar(
      "onAddMenuPressed",
      "onAddMenuPressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  void onPinPressed(BuildContext context) {
    Get.snackbar(
      "onPinPressed",
      "onPinPressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  _initData() {
    update(["conversations"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
  }
}
