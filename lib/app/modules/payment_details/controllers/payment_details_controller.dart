import 'package:get/get.dart';

class PaymentDetailsController extends GetxController {

  final count = 0.obs;

  bool paymentToogle = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setPaymentToogle(bool paymentToogle){
    this.paymentToogle = paymentToogle;
    update(["payment_toogle"]);
  }
}
