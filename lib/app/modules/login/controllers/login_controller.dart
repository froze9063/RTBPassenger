import 'package:device_id/device_id.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/callback/login_callback.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final count = 0.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  Color emailBorderColor = Colors.white;
  Color passwordBorderColor = Colors.white;

  String firebase_token = "";
  bool isPasswordSecured = true;
  bool isRememberMe = false;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loadUser();
    getToken();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> loadUser() async {
    SharedPreferences.getInstance().then((prefs){
      isRememberMe = prefs.getBool("is_remember") ?? false;
      if(isRememberMe){
        emailController.text = prefs.getString("remember_email") ?? "";
        passwordController.text = prefs.getString("remember_password") ?? "";
      }
      else{
        emailController.text = "";
        passwordController.text = "";
      }
    });
  }

  Future<void> getToken() async {
    firebase_token = await FirebaseMessaging.instance.getToken() ?? "";
  }

  setPasswordSecured(String type){
    if(type == "password"){
      isPasswordSecured = !isPasswordSecured;
      update(["border_color"]);
    }
  }

  setRememberMe(){
      isRememberMe = !isRememberMe;
      update(["remember_me"]);
  }

  void changeBorderColor(String text, String type){
    if(text.length > 0){
      if(type == "email"){
        emailBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
      else{
        passwordBorderColor = Color.fromRGBO(255, 205, 56, 1.0);
      }
    }
    else{
      if(type == "email"){
        emailBorderColor = Colors.white;
      }
      else{
        passwordBorderColor = Colors.white;
      }
    }
    update(["border_color"]);
  }

  Future<void> login(LoginCallback loginCallback) async {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String deviceId = await DeviceId.getID;

    if(email.isEmpty){
      CustomToast.showToast("Please input email!");
      return;
    }

    if(password.isEmpty){
      CustomToast.showToast("Please input password!");
      return;
    }

    loginCallback.onLoginLoading();

    Map body = new Map();
    body["provider"] = "Email";
    body["email"] = email;
    body["password"] = password;
    body["device_id"] = deviceId;
    body["device_token"] = firebase_token;
    body["version"] = "1.0.0";
    body["os"] = "Android";

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection("").post(MyConstant.LOGIN, data: body).then((response) {
      Map responseMap = response.data;
      Map userMap = responseMap["user"];

      String token = responseMap["token"] ?? "";
      int id = userMap["id"] ?? 0;
      String name = userMap["name"] ?? "";
      String email = userMap["email"] ?? "";
      String contact = userMap["contact"] ?? "";
      String img = userMap["img"] ?? "";
      String provider = userMap["provider"] ?? "";
      String os = userMap["os"] ?? "";
      String uid = userMap["uid"] ?? "";
      String remarks = userMap["remarks"] ?? "";
      String last_active = userMap["last_active"] ?? "";
      String status = userMap["status"] ?? "";
      String created_at = userMap["created_at"] ?? "";

      SharedPreferences.getInstance().then((prefs){
        prefs.setString("access_token", token);
        prefs.setString("name", name);
        prefs.setInt("id", id);
        prefs.setString("email", email);
        prefs.setString("contact", contact);
        prefs.setString("img", img);
        prefs.setString("provider", provider);
        prefs.setString("os", os);
        prefs.setString("uid", uid);
        prefs.setString("remarks", remarks);
        prefs.setString("last_active", last_active);
        prefs.setString("status", status);
        prefs.setString("created_at", created_at);

        if(isRememberMe){
          prefs.setBool("is_remember",true);
          prefs.setString("remember_email", email);
          prefs.setString("remember_password", password);
        }
        else{
          prefs.setBool("is_remember",false);
          prefs.remove("remember_email");
          prefs.remove("remember_password");
        }
      });

      loginCallback.onLoginSuccess("Successfully Login!", "success");

    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          if(errorCode == 401){
            loginCallback.onLoginFailed(errorCode,MyConstant.UNAUTHORIZED_ERROR);
          }
          else{
            loginCallback.onLoginFailed(errorCode,MyConstant.UNKNOWN_ERROR);
          }
          print(response);
        }
        catch(error){
          loginCallback.onLoginFailed(0,MyConstant.UNKNOWN_ERROR);
          print(error);
        }
        print(error);
      }
      else{
        loginCallback.onLoginFailed(0,MyConstant.UNKNOWN_ERROR);
      }
    });
  }
}
