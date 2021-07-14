import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final count = 0.obs;

  late TextEditingController emailController;

  @override
  void onInit() {
    emailController = TextEditingController();
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
