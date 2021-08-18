import 'package:get/get.dart';

class TripCompletedController extends GetxController {
  //TODO: Implement TripCompletedController

  final count = 0.obs;
  int tripId = 0;

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["trip_id"] != null){
        tripId = Get.arguments["trip_id"];
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
