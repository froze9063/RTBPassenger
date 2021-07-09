import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  late TextEditingController fromController;
  late TextEditingController toController;

  @override
  void onInit() {
    super.onInit();
    fromController = TextEditingController();
    toController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
