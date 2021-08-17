import 'package:get/get.dart';

class PaymentWebviewController extends GetxController {

  final count = 0.obs;
  String url = "";

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["url"] != null){
        url = Get.arguments["url"];
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
