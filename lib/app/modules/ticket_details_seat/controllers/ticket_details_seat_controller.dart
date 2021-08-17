import 'package:get/get.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/modules/payment_details/views/payment_details_view.dart';

class TicketDetailsSeatController extends GetxController {
  //TODO: Implement TicketDetailsSeatController

  final count = 0.obs;

  late TripModel tripModel;
  String seatList = "";
  String price = "";

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["trip_model"] != null){
        tripModel = Get.arguments["trip_model"];
      }

      if(Get.arguments["seat_list"] != null){
        seatList = Get.arguments["seat_list"];
      }

      if(Get.arguments["price"] != null){
        price = Get.arguments["price"];
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

  void gotoDetailBookSeat(){
    Get.to(() => PaymentDetailsView(), arguments: {"trip_model" : tripModel,
      "seat_list" : seatList, "price" : price});
  }
}
