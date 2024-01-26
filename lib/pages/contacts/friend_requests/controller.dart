import 'package:get/get.dart';

class FriendRequestsController extends GetxController {
  FriendRequestsController();

  _initData() {
    update(["friend_requests"]);
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
