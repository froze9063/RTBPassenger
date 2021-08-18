import 'package:get/get.dart';
import 'package:ridethebee/app/model/trip_model.dart';

class PaymentWebviewController extends GetxController {

  final count = 0.obs;
  String url = "";

  late TripModel tripModel;
  String seatList = "";
  String price = "";
  int selectedPayment = 0;

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["url"] != null){
        url = Get.arguments["url"];
      }
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
