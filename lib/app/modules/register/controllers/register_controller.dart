import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/callback/register_callback.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';

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

  bool isPasswordSecured = true;
  bool isPasswordConfirmSecured = true;

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

  void resetBorder(){
    emailController.text = "";
    fullnameController.text = "";
    mobileController.text = "";
    passwordController.text = "";
    confirmPasswordController.text = "";

    changeBorderColor("", "email");
    changeBorderColor("", "fullname");
    changeBorderColor("", "mobile");
    changeBorderColor("", "password");
    changeBorderColor("", "confirm_password");
  }

  void register(RegisterCallback registerCallback){
    String email = emailController.text.toString().trim();
    String name = fullnameController.text.toString().trim();
    String contact = mobileController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String confirmPassword = confirmPasswordController.text.toString().trim();
    
    if(email.isEmpty){
      CustomToast.showToast("Please input email!");
      return;
    }

    if(name.isEmpty){
      CustomToast.showToast("Please input fullname!");
      return;
    }

    if(contact.isEmpty){
      CustomToast.showToast("Please input phone!");
      return;
    }

    if(password.isEmpty){
      CustomToast.showToast("Please input password!");
      return;
    }

    if(confirmPassword != password){
      CustomToast.showToast("Password doesn't match!");
      return;
    }

    registerCallback.onRegisterLoading();

    Map body = new Map();
    body["email"] = email;
    body["name"] = name;
    body["contact"] = contact;
    body["password"] = password;

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection("").post(MyConstant.REGISTER, data: body).then((response) {
      Map responseMap = response.data;
      if(responseMap["success"] != null){
        String message = "Successfully Register!";
        registerCallback.onRegisterSuccess(message,"success");
        resetBorder();
      }
      else{
        String message = responseMap["error"];
        registerCallback.onRegisterSuccess(message,"error");
      }
    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            registerCallback.onRegisterFailed(errorCode,error);
          }
          else{
            registerCallback.onRegisterFailed(errorCode,MyConstant.UNKNOWN_ERROR);
          }

          print(response);
        }
        catch(error){
          registerCallback.onRegisterFailed(0,MyConstant.UNKNOWN_ERROR);
          print(error);
        }

        print(error);
      }
      else{
        registerCallback.onRegisterFailed(0,MyConstant.UNKNOWN_ERROR);
      }
    });
  }
}
