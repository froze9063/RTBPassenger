import 'package:get/get.dart';

import '../controllers/ticket_details_book_controller.dart';

class TicketDetailsBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketDetailsBookController>(
      () => TicketDetailsBookController(),
    );
  }
}
