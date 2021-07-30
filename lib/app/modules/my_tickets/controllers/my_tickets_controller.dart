import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTicketsController extends GetxController with SingleGetTickerProviderMixin{
  //TODO: Implement MyTicketsController

  final count = 0.obs;

  late TabController tabController;
  int tab_type = 0;

  @override
  void onInit() {
    tab_type = Get.arguments["tab_type"];
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }

  @override
  void onReady() {
    if(tab_type == 0){
      tabController.animateTo(0);
    }
    else{
      tabController.animateTo(1);
    }
    update(["tab_bar"]);
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
