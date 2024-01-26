import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  void createAccount() {
    Get.toNamed(RouteNames.authPassword);
  }

  void recoverAccount() {
    Get.toNamed(RouteNames.authPassword);
  }

  _initData() {
    update(["welcome"]);
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
