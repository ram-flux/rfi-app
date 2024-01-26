import 'package:get/get.dart';

class ChattingController extends GetxController {
  ChattingController();

  _initData() {
    update(["chatting"]);
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
