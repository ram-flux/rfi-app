import 'package:get/get.dart';
import 'package:ramflux_app/shared/index.dart';

class SplashController extends GetxController {
  SplashController();

  void redirect() {
    Get.offAllNamed(RouteNames.main);
  }

  @override
  void onReady() {
    super.onReady();
    redirect();
  }
}
