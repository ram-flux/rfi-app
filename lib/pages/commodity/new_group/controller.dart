import 'package:get/get.dart';

class NewGroupController extends GetxController {
  NewGroupController();

  _initData() {
    update(["new_group"]);
  }

  void onTap() {}

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
