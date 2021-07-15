import 'package:get/get.dart';

import '../controllers/car_seats_booked_controller.dart';

class CarSeatsBookedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarSeatsBookedController>(
      () => CarSeatsBookedController(),
    );
  }
}
