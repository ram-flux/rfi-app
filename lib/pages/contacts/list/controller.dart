import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ContactListController extends GetxController {
  ContactListController();

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  void onRefresh() async {
    refreshController.refreshCompleted();

    update(["contacts_list"]);
  }

  void onDeletePressed(BuildContext context) {
    Get.snackbar(
      "onDeletePressed",
      "onDeletePressed",
      snackPosition: SnackPosition.TOP,
    );
  }

  _initData() {
    update(["contacts_list"]);
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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
