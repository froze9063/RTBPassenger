import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTicketsController extends GetxController with SingleGetTickerProviderMixin{
  //TODO: Implement MyTicketsController

  final count = 0.obs;

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
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
