import 'package:get/get.dart';

import '../controllers/car_seats_controller.dart';

class CarSeatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarSeatsController>(
      () => CarSeatsController(),
    );
  }
}
