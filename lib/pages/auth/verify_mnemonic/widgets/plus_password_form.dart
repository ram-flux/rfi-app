import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class PlusPasswordForm extends StatefulWidget {
  final Function(String) onConfirmed;

  const PlusPasswordForm({Key? key, required this.onConfirmed})
      : super(key: key);

  @override
  State<PlusPasswordForm> createState() => _PlusPasswordFormState();
}

class _PlusPasswordFormState extends State<PlusPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();

  void _onConfirmed() {
    if (_formKey.currentState!.validate()) {
      widget.onConfirmed(passwordController.text);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.titleLarge(
        LocaleKeys.authVerifyMnemonicBottomSheetTitle.tr,
        size: 24,
        weight: FontWeight.w600,
      ).marginOnly(bottom: 14),
      TextWidget.titleSmall(
        LocaleKeys.authVerifyMnemonicBottomSheetSubtitle.tr,
        color: AppColors.secondary,
      ).marginOnly(bottom: 24),
      Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: <Widget>[
          TextFormFieldWidget(
            controller: passwordController,
            isObscure: true,
            hintText: LocaleKeys.authVerifyMnemonicBottomSheetPassword.tr,
            validator: (v) {
              if (v!.isEmpty) {
                return LocaleKeys
                    .authVerifyMnemonicBottomSheetPasswordRequired.tr;
              }
              return null;
            },
          ).marginSymmetric(vertical: 12),
          TextFormFieldWidget(
            controller: passwordAgainController,
            isObscure: true,
            hintText: LocaleKeys.authVerifyMnemonicBottomSheetPasswordAgain.tr,
            validator: (v) {
              if (v!.isEmpty) {
                return LocaleKeys
                    .authVerifyMnemonicBottomSheetPasswordAgainRequired.tr;
              }
              if (v != passwordController.text) {
                return LocaleKeys
                    .authVerifyMnemonicBottomSheetPasswordNotMatch.tr;
              }
              return null;
            },
          ).marginSymmetric(vertical: 12),
        ].toColumn(),
      ),
      ButtonWidget.primary(
        LocaleKeys.authVerifyMnemonicBottomSheetButtonText.tr,
        onTap: _onConfirmed,
      ).marginOnly(top: 30),
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
  }
}
