import 'package:get/get.dart';
import 'package:ridethebee/app/model/trip_model.dart';

class TicketDetailsController extends GetxController {

  final count = 0.obs;

  late TripModel tripModel;
  String seatList = "";

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["trip_model"] != null){
        tripModel = Get.arguments["trip_model"];
      }

      if(Get.arguments["seat_list"] != null){
        seatList = Get.arguments["seat_list"];
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
