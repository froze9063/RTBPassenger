import 'package:get/get.dart';

class TicketDetailsController extends GetxController {
  //TODO: Implement TicketDetailsController

  final count = 0.obs;
  int fromStatus = 0;

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["from_status"] != null){
        fromStatus = Get.arguments["from_status"];
      }
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
