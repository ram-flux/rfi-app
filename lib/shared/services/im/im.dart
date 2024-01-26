import 'package:get/get.dart';

class IMService extends GetxService {
  static IMService get to => Get.find();

  // 未读消息总数
  final totalUnreadCount = 0.obs;

  Future<IMService> init() async {
    return this;
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
