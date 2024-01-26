import 'package:get/get.dart';

class FriendProfileController extends GetxController {
  FriendProfileController();

  _initData() {
    update(["friend_profile"]);
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
