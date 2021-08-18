import 'package:get/get.dart';
import 'package:ridethebee/app/model/trip_model.dart';

class PaymentSuccessfullController extends GetxController {
  //TODO: Implement PaymentSuccessfullController

  final count = 0.obs;
  late TripModel tripModel;
  String seatList = "";
  String price = "";
  int selectedPayment = 0;

  String ticket_id = "";
  String transaction_id = "";

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

      if(Get.arguments["selected_payment"] != null){
        selectedPayment = Get.arguments["selected_payment"];
      }

      if(Get.arguments["ticket_id"] != null){
        ticket_id = Get.arguments["ticket_id"];
      }

      if(Get.arguments["transaction_id"] != null){
        transaction_id = Get.arguments["transaction_id"];
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
