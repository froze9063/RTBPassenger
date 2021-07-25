import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final count = 0.obs;

  late TextEditingController fullnameEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController confirmPasswordEditingController;

  Color fullnameBorderColor = Colors.white;
  Color mobileBorderColor = Colors.white;
  Color passwordBorderColor = Colors.white;
  Color confirmPasswordBorderColor = Colors.white;

  @override
  void onInit() {

    fullnameEditingController = TextEditingController();
    fullnameEditingController.text = "Elizabeth Tan Huey Ling";

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

  void changeBorderColor(String text, String type){
    if(text.length > 0){
      if(type == "fullname"){
        fullnameBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
      if(type == "mobile"){
        mobileBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
      if(type == "password"){
        passwordBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
      else{
        confirmPasswordBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
    }
    else{
      if(type == "fullname"){
        fullnameBorderColor = Colors.white;
      }
      if(type == "mobile"){
        mobileBorderColor = Colors.white;
      }
      if(type == "password"){
        passwordBorderColor = Colors.white;
      }
      else{
        confirmPasswordBorderColor = Colors.white;
      }
    }
    update(["border_color"]);
  }
}
