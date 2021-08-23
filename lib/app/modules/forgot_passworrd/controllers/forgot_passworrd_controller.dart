import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassworrdController extends GetxController {
  //TODO: Implement ForgotPassworrdController

  final count = 0.obs;
  late TextEditingController emailEditing;
  Color emailBorderColor = Colors.white;

  @override
  void onInit() {
    emailEditing = TextEditingController();
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
      if(type == "email"){
        emailBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
    }
    else{
      if(type == "email"){
        emailBorderColor = Colors.white;
      }
    }
    update(["border_color"]);
  }
}
