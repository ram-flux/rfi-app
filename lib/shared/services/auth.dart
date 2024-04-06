// import 'package:im_flutter_plugin/ffi.dart';

import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  Future<String> getPhrase() async {
    return 'api.getPhrase()';
  }
}
