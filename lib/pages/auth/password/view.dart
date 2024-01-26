import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';
import 'widgets/pin.dart';

class PasswordPage extends GetView<PasswordController> {
  const PasswordPage({Key? key}) : super(key: key);

  Widget _buildForm() {
    return Form(
      key: controller.formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // pin
        PinPutWidget(
          controller: controller.pinController,
          length: 4,
          validator: controller.pinValidator,
          onSubmit: controller.onPinSubmit,
          onChanged: controller.onPinChanged,
        ).paddingBottom(20),

        TextWidget.bodyLarge(LocaleKeys.authPasswordHintText.tr)
            .alignCenter()
            .paddingBottom(50),

        controller.isShowConfirmButton
            ? ButtonWidget.primary(
                LocaleKeys.authPasswordButtonText.tr,
                onTap: controller.onConfirm,
              ).paddingBottom(AppSpace.listRow)
            : Container(),
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
        child: <Widget>[
      // Title
      TextWidget.titleLarge(LocaleKeys.authPasswordTitle.tr)
          .paddingTop(120)
          .paddingBottom(40)
          .alignCenter(),
      // Form
      _buildForm(),
    ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .paddingHorizontal(AppSpace.page));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(
      init: PasswordController(),
      id: "password",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
              titleString: LocaleKeys.authPasswordAppBarTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
