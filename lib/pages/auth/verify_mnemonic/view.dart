import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';
import 'widgets/plus_password_form.dart';
import 'widgets/tag_input.dart';

class VerifyMnemonicPage extends GetView<VerifyMnemonicController> {
  const VerifyMnemonicPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextWidget.titleSmall(
        LocaleKeys.authVerifyMnemonicHintText.tr,
        maxLines: 2,
        softWrap: true,
      ).marginOnly(top: 50, bottom: 20),
      TagInputWidget(
        onChanged: controller.onMnemonicChanged,
      ),
      TextWidget.bodyMedium(
        LocaleKeys.authVerifyMnemonicTipsText.tr,
        maxLines: 2,
        softWrap: true,
        color: AppColors.secondary,
      ).paddingHorizontal(12),
      if (controller.mnemonic.length >= 12)
        ButtonWidget.primary(
          LocaleKeys.authVerifyMnemonicButtonText.tr,
          onTap: () {
            Get.bottomSheet(
              Container(
                color: AppColors.background,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpace.page,
                  vertical: 24,
                ),
                child: PlusPasswordForm(
                  onConfirmed: controller.onPlusPasswordFormConfirmed,
                ),
              ),
            );
          },
        ).marginOnly(top: 50),
    ].toColumn().paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyMnemonicController>(
      init: VerifyMnemonicController(),
      id: "verify_mnemonic",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.authVerifyMnemonicAppBarTitle.tr,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
