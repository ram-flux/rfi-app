import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class CreateCommodityController extends GetxController {
  CreateCommodityController();

  _initData() {
    update(["create_commodity"]);
  }

  void onTap() {}

  void next() {
    Get.toNamed(RouteNames.commodityCharting);
  }

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
