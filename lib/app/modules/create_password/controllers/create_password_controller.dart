import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {
  //TODO: Implement CreatePasswordController

  final count = 0.obs;
  Color passwordBorderColor = Colors.white;
  Color confirmPasswordBorderColor = Colors.white;

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isPasswordSecured = true;
  bool isPasswordConfirmSecured = true;

  @override
  void onInit() {
    passwordController = new TextEditingController();
    confirmPasswordController = new TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setPasswordToogle(String type){
    if(type == "password"){
      isPasswordSecured = !isPasswordSecured;
    }
    else{
      isPasswordConfirmSecured = !isPasswordConfirmSecured;
    }
    update(["border_color"]);
  }

  void changeBorderColor(String text, String type){
    if(text.length > 0){
      if(type == "password"){
        passwordBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
      else{
        confirmPasswordBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
    }
    else{
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
