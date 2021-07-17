import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final count = 0.obs;

  late TextEditingController emailController;
  late TextEditingController textEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController confirmPasswordEditingController;

  @override
  void onInit() {
    emailController = TextEditingController();
    emailController.text = "John Travis Scott Travolta";

    textEditingController = TextEditingController();
    textEditingController.text = "Elizabeth Tan Huey Ling";

    phoneEditingController = TextEditingController();
    phoneEditingController.text = "+65 4589 0321";

    passwordEditingController = TextEditingController();
    passwordEditingController.text = "password123";

    confirmPasswordEditingController = TextEditingController();
    confirmPasswordEditingController.text = "password123";
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
