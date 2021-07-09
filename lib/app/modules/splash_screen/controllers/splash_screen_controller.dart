import 'package:get/get.dart';
import 'dart:async';

import 'package:ridethebee/app/modules/boarding/views/boarding_view.dart';

class SplashScreenController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    setSplash();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setSplash(){
    Timer(Duration(seconds: 2), () async {
      Get.to(BoardingView());
    });
  }
}
