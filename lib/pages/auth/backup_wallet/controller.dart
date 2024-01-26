import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class BackupWalletController extends GetxController {
  BackupWalletController();

  final tips = <TipsModel>[
    TipsModel(
      AssetsIcons.backupWalletTip1Svg,
      LocaleKeys.authBackupWalletTip1.tr,
    ),
    TipsModel(
      AssetsIcons.backupWalletTip2Svg,
      LocaleKeys.authBackupWalletTip2.tr,
    ),
    TipsModel(
      AssetsIcons.backupWalletTip3Svg,
      LocaleKeys.authBackupWalletTip3.tr,
    ),
    TipsModel(
      AssetsIcons.backupWalletTip4Svg,
      LocaleKeys.authBackupWalletTip4.tr,
    ),
  ];

  void next() {
    Get.toNamed(RouteNames.authMnemonicPhrase);
  }

  _initData() {
    update(["backup_wallet"]);
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

class TipsModel {
  final String iconUrl;
  final String content;

  TipsModel(this.iconUrl, this.content);
}
