import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class VerifyMnemonicController extends GetxController {
  VerifyMnemonicController();

  List<String> mnemonic = [];

  void onMnemonicChanged(List<String> val) {
    mnemonic = val;
    update(["verify_mnemonic"]);
  }

  void onPlusPasswordFormConfirmed(String password) {
    next();
  }

  void next() {
    Get.offAllNamed(RouteNames.main);
  }

  _initData() {
    update(["verify_mnemonic"]);
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
