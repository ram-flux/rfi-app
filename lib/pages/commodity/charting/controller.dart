import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class ChartingController extends GetxController {
  ChartingController();

  _initData() {
    update(["charting"]);
  }

  void toDetails() {
    Get.toNamed(RouteNames.commodityDetails);
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
