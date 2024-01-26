import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

import '../index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    DateTime? lastPressedAt;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();
          Get.snackbar(
            'LocaleKeys.snackbarExitTitle.tr',
            'LocaleKeys.snackbarExitMessage.tr',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black.withOpacity(0.8),
            colorText: Colors.white,
            duration: const Duration(seconds: 1),
          );
          return;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) {
            return Obx(() => BuildNavigation(
                  currentIndex: controller.currentPageIndex,
                  items: [
                    // Rf
                    NavigationItemModel(
                      label: LocaleKeys.tabBarRf.tr,
                      iconSvg: AssetsIcons.tabbarRfSvg,
                      badgeCount: IMService.to.totalUnreadCount.value,
                    ),

                    // Contacts
                    NavigationItemModel(
                      label: LocaleKeys.tabBarContacts.tr,
                      iconSvg: AssetsIcons.tabbarContactsSvg,
                    ),

                    // Favorites
                    NavigationItemModel(
                      label: LocaleKeys.tabBarFavorites.tr,
                      iconSvg: AssetsIcons.tabbarFavoritesSvg,
                    ),

                    // Settings
                    NavigationItemModel(
                      label: LocaleKeys.tabBarSettings.tr,
                      iconSvg: AssetsIcons.tabbarSettingsSvg,
                    ),
                  ],
                  onTap: controller.switchPage,
                ));
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: const [
            ConversationsPage(),
            ContactListPage(),
            Center(child: Text('3')),
            Center(child: Text('4')),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: Get.find<MainController>(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}
