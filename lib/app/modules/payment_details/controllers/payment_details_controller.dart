import 'package:get/get.dart';

class PaymentDetailsController extends GetxController {

  final count = 0.obs;

  int selectedPayment = -1;

  bool paymentToogle = false;
  bool isChecked = false;

  late List<Map> paymentList;

  @override
  void onInit() {
    paymentList = [];
    setPaymentList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void setPaymentToogle(bool paymentToogle) {
    this.paymentToogle = paymentToogle;
    update(["payment_toogle"]);
  }

  void setChecked(bool isChecked) {
    this.isChecked = isChecked;
    update(["checkbox"]);
  }

  void setPaymentList() {
    Map paymentMap = Map();
    paymentMap["image"] = "assets/ic_debit_card.png";
    paymentMap["name"] = "Credit Card / Debit Card";
    paymentMap["description"] = "Use Visa, MasterCard and more";

    Map paymentMap2 = Map();
    paymentMap2["image"] = "assets/ic_online_booking.png";
    paymentMap2["name"] = "Online Banking";
    paymentMap2["description"] = "Internet banking log-in needed";

    paymentList.add(paymentMap);
    paymentList.add(paymentMap2);
  }

  void setSelectedPayment(int index){
    this.selectedPayment = index;
    update(["payment"]);
  }
}