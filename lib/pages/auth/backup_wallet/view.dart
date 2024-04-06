import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';

class BackupWalletPage extends GetView<BackupWalletController> {
  const BackupWalletPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextWidget.titleMedium(
        LocaleKeys.authBackupWalletHintText.tr,
      ).alignCenter().marginOnly(top: 50, bottom: 20),
      <Widget>[
        ...controller.tips.map((item) {
          return <Widget>[
            IconWidget.svg(
              item.iconUrl,
              width: 40,
              height: 40,
            ).marginSymmetric(horizontal: 10),
            TextWidget.bodyLarge(
              item.content,
              maxLines: 2,
              softWrap: true,
            ).flexible(),
          ].toRow().paddingSymmetric(vertical: 20);
        }),
      ].toColumn().paddingSymmetric(vertical: 20),
      ButtonWidget.primary(
        LocaleKeys.authBackupWalletButtonText.tr,
        height: 48,
        onTap: controller.next,
      ).marginOnly(top: 40)
    ].toColumn().paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BackupWalletController>(
      init: BackupWalletController(),
      id: "backup_wallet",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.authBackupWalletAppBarTitle.tr,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
