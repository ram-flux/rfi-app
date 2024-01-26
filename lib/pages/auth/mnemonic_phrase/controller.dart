import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class MnemonicPhraseController extends GetxController {
  MnemonicPhraseController();

  void next() {
    Get.toNamed(RouteNames.authVerifyMnemonic);
  }

  _initData() {
    update(["mnemonic_phrase"]);
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
