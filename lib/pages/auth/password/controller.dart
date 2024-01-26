import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class PasswordController extends GetxController {
  PasswordController();

  TextEditingController pinController = TextEditingController();

  GlobalKey formKey = GlobalKey<FormState>();

  bool isShowConfirmButton = false;

  String? pinValidator(pin) {
    return pin.length == 4
        ? null
        : LocaleKeys.commonMessageInvalid
            .trParams({"param": LocaleKeys.authPasswordText.tr});
  }

  void onPinSubmit(val) {
    debugPrint("onPinSubmit: $val");
  }

  void onPinChanged(val) {
    debugPrint("onPinChanged: $val");
    isShowConfirmButton = val.length == 4;
    update(["password"]);
  }

  void onConfirm() {
    if ((formKey.currentState as FormState).validate()) {
      Get.toNamed(RouteNames.authBackupWallet);
    }
  }

  _initData() {
    update(["password"]);
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
    pinController.dispose();
  }
}
