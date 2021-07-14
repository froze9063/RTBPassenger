import 'package:get/get.dart';

import '../controllers/pit_stop_controller.dart';

class PitStopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PitStopController>(
      () => PitStopController(),
    );
  }
}
