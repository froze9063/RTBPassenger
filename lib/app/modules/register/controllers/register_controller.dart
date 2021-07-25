import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;

  late TextEditingController emailController;
  late TextEditingController fullnameController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  Color emailBorderColor = Colors.white;
  Color fullnameBorderColor = Colors.white;
  Color mobileBorderColor = Colors.white;
  Color passwordBorderColor = Colors.white;
  Color confirmPasswordBorderColor = Colors.white;

  @override
  void onInit() {
    super.onInit();
    emailController = new TextEditingController();
    fullnameController = new TextEditingController();
    mobileController = new TextEditingController();
    passwordController = new TextEditingController();
    confirmPasswordController = new TextEditingController();
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
      if(type == "email"){
        emailBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
      else if(type == "fullname"){
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
      if(type == "email"){
        emailBorderColor = Colors.white;
      }
      else if(type == "fullname"){
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
