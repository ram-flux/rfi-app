import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import 'index.dart';
import 'widgets/carousel.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.page),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            const Carousel(),
            const SizedBox(height: 80),
            FilledButton(
              onPressed: controller.createAccount,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                fixedSize: const Size.fromHeight(48),
              ),
              child: _buildButtonContent(LocaleKeys.welcomeCreateAccount.tr),
            ),
            const SizedBox(height: 26),
            OutlinedButton(
              onPressed: controller.recoverAccount,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                fixedSize: const Size.fromHeight(48),
              ),
              child: _buildButtonContent(LocaleKeys.welcomeRecoverAccount.tr),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonContent(String buttonText) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        const Positioned(
          right: 0,
          top: -2,
          child: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
