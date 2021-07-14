import 'package:get/get.dart';

import '../controllers/trip_completed_controller.dart';

class TripCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripCompletedController>(
      () => TripCompletedController(),
    );
  }
}
