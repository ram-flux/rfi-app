import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class InviteFriendsController extends GetxController {
  InviteFriendsController();

  final List users = [
    {'name': 'John', 'group': 'A'},
    {'name': 'Will', 'group': 'B'},
    {'name': 'Beth', 'group': 'A'},
    {'name': 'Miranda', 'group': 'B'},
    {'name': 'Mike', 'group': 'C'},
    {'name': 'Danny', 'group': 'C'},
  ];

  _initData() {
    update(["invite_friends"]);
  }

  void onTap() {}

  void next() {
    Get.toNamed(RouteNames.commodityCreateCommodity);
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
