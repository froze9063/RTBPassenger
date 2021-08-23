import 'package:get/get.dart';

import '../controllers/forgot_passworrd_controller.dart';

class ForgotPassworrdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPassworrdController>(
      () => ForgotPassworrdController(),
    );
  }
}
