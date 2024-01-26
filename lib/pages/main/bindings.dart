import 'package:get/get.dart';

import '../index.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConversationsController>(() => ConversationsController());
    Get.lazyPut<ContactListController>(() => ContactListController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
