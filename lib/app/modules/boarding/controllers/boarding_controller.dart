import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {

  final count = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = new PageController();
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
