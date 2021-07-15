import 'package:get/get.dart';

import '../controllers/ticket_details_seat_controller.dart';

class TicketDetailsSeatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketDetailsSeatController>(
      () => TicketDetailsSeatController(),
    );
  }
}
