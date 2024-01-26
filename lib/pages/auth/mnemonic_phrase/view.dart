import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';
import 'widgets/mnemonic_list.dart';

class MnemonicPhrasePage extends GetView<MnemonicPhraseController> {
  const MnemonicPhrasePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      TextWidget.titleSmall(
        LocaleKeys.authMnemonicPhraseHintText.tr,
      ).marginOnly(top: 50, bottom: 50),
      const MnemonicList(),
      ButtonWidget.primary(
        LocaleKeys.authMnemonicPhraseButtonText.tr,
        onTap: controller.next,
      ).marginOnly(top: 50),
    ].toColumn().paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MnemonicPhraseController>(
      init: MnemonicPhraseController(),
      id: "mnemonic_phrase",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: LocaleKeys.authMnemonicPhraseAppBarTitle.tr,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
