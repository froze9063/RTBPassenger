import 'package:get/get.dart';
import 'dart:async';

import 'package:ridethebee/app/modules/boarding/views/boarding_view.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      SharedPreferences.getInstance().then((prefs) {
        String token = prefs.getString("access_token") ?? "";
        if(token.isNotEmpty){
          Get.back();
          Get.to(HomeView());
        }
        else{
          Get.back();
          Get.to(BoardingView());
        }
      });
    });
  }
}
