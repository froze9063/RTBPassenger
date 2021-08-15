import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ridethebee/app/callback/delete_image_callback.dart';
import 'package:ridethebee/app/callback/edit_profile_callback.dart';
import 'package:ridethebee/app/callback/upload_photo_callback.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/login/views/login_view.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final count = 0.obs;

  final picker = ImagePicker();
  late File _image;
  String img64 = "";

  late TextEditingController fullnameEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController confirmPasswordEditingController;

  Color fullnameBorderColor = Colors.white;
  Color mobileBorderColor = Colors.white;
  Color passwordBorderColor = Colors.white;
  Color confirmPasswordBorderColor = Colors.white;

  String name = "";
  String email = "";
  String urlImage = "";
  String phone = "";
  String access_token = "";

  @override
  void onInit() {
    fullnameEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    confirmPasswordEditingController = TextEditingController();
    loadUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void loadUser(){
    SharedPreferences.getInstance().then((prefs){
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";
      urlImage = prefs.getString("img") ?? "";
      phone = prefs.getString("contact") ?? "";
      access_token = prefs.getString("access_token") ?? "";
      fullnameEditingController.text = name;
      phoneEditingController.text = phone;
      update(["profile"]);
    });
  }

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

  Future getImage(int type, UploadPhotoCallback uploadPhotoCallback) async {
    final pickedFile = await picker.getImage(source: type == 0 ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 500.0, maxHeight: 500.0);
    if(pickedFile != null){
      _image = File(pickedFile.path ?? "");
      final bytes = _image.readAsBytesSync();
      img64 = base64Encode(bytes);
      Get.back();
      uploadPhoto(uploadPhotoCallback);
    }
  }

  void logout(){
    SharedPreferences.getInstance().then((prefs){
      prefs.remove("access_token");
      prefs.remove("name");
      prefs.remove("id");
      prefs.remove("email");
      prefs.remove("contact");
      prefs.remove("img");
      prefs.remove("provider");
      prefs.remove("os");
      prefs.remove("uid");
      prefs.remove("remarks");
      prefs.remove("last_active");
      prefs.remove("status");
      prefs.remove("created_at");
      prefs.remove("is_remember");
      prefs.remove("remember_email");
      prefs.remove("remember_password");
      prefs.remove("company_id");
      prefs.remove("pickup_points");
      prefs.remove("dropoff_points");
      prefs.clear();
      Get.back();
      Get.offAll(() => LoginView());
    });
  }
  
  void editProfile(EditProfileCallback editProfileCallback){
    String name = fullnameEditingController.text.toString().trim();
    String contact = phoneEditingController.text.toString().trim();
    String password = passwordEditingController.text.toString().trim();
    String confirmPass = confirmPasswordEditingController.text.toString().trim();

    if(name.isEmpty){
      CustomToast.showToast("Please input name!");
      return;
    }

    if(contact.isEmpty){
      CustomToast.showToast("Please input phone!");
      return;
    }

    if(password.isNotEmpty){
      if(confirmPass.isEmpty){
        CustomToast.showToast("Please input confirm password!");
        return;
      }

      if(password != confirmPass){
        CustomToast.showToast("Password doesn't match!");
        return;
      }
    }

    editProfileCallback.onEditProfileLoading();

    Map body = new Map();
    body["name"] = name;
    body["contact"] = contact;

    if(password.isNotEmpty){
      body["password"] = password;
    }

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(access_token).post(MyConstant.EDIT_PROFILE, data: body).then((response) {
      Map responseMap = response.data;
      if(responseMap["success"] != null){

        Map dataMap = responseMap["data"];
        String strContact = dataMap["contact"];

        SharedPreferences.getInstance().then((prefs){
          prefs.setString("name", name);
          prefs.setString("contact", strContact);

        });

        String message = "Successfully Update Profile!";
        editProfileCallback.onEditProfileSuccess(message,"success");
      }
      else{
        String message = responseMap["error"];
        editProfileCallback.onEditProfileSuccess(message,"error");
      }
    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            editProfileCallback.onEditProfileFailed(errorCode,error);
          }
          else{
            editProfileCallback.onEditProfileFailed(errorCode,MyConstant.UNKNOWN_ERROR);
          }

          print(response);
        }
        catch(error){
          editProfileCallback.onEditProfileFailed(0,MyConstant.UNKNOWN_ERROR);
          print(error);
        }

        print(error);
      }
      else{
        editProfileCallback.onEditProfileFailed(0,MyConstant.UNKNOWN_ERROR);
      }
    });
  }

  void removePhoto(RemoveImageCallback removeImageCallback){

    removeImageCallback.onRemoveImageLoading();

    Map body = Map();
    body["img"] = "https://ridethebee-staging.vecapital.asia/storage/app/passengers/$urlImage";

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(access_token).delete(MyConstant.DELETE_PROFILE, data: body).then((response) {
      Map responseMap = response.data;
      if(responseMap["success"] != null){

        SharedPreferences.getInstance().then((prefs){
          prefs.setString("img", "");
          loadUser();
        });

        String message = "Successfully Delete Image!";
        removeImageCallback.onRemoveImageSuccess(message,"success");
      }
      else{
        String message = responseMap["error"];
        removeImageCallback.onRemoveImageSuccess(message,"error");
      }
    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            removeImageCallback.onRemoveImageFailed(errorCode,error);
          }
          else{
            removeImageCallback.onRemoveImageFailed(errorCode,MyConstant.UNKNOWN_ERROR);
          }

          print(response);
        }
        catch(error){
          removeImageCallback.onRemoveImageFailed(0,MyConstant.UNKNOWN_ERROR);
          print(error);
        }

        print(error);
      }
      else{
        removeImageCallback.onRemoveImageFailed(0,MyConstant.UNKNOWN_ERROR);
      }
    });
  }

  void uploadPhoto(UploadPhotoCallback uploadPhotoCallback){

    uploadPhotoCallback.onUploadPhotoLoading();

    Map body = Map();
    body["img"] = img64;

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(access_token).post(MyConstant.UPLOAD_PROFILE, data: body).then((response) {
      Map responseMap = response.data;
      if(responseMap["success"] != null){

        String img = responseMap["img"];
        SharedPreferences.getInstance().then((prefs){
          prefs.setString("img", img);
          loadUser();
        });

        String message = "Successfully Upload Image!";
        uploadPhotoCallback.onUploadPhotoSuccess(message,"success");
      }
      else{
        String message = responseMap["error"];
        uploadPhotoCallback.onUploadPhotoSuccess(message,"error");
      }
    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            uploadPhotoCallback.onUploadPhotoFailed(errorCode,error);
          }
          else{
            uploadPhotoCallback.onUploadPhotoFailed(errorCode,MyConstant.UNKNOWN_ERROR);
          }

          print(response);
        }
        catch(error){
          uploadPhotoCallback.onUploadPhotoFailed(0,MyConstant.UNKNOWN_ERROR);
          print(error);
        }

        print(error);
      }
      else{
        uploadPhotoCallback.onUploadPhotoFailed(0,MyConstant.UNKNOWN_ERROR);
      }
    });
  }
}
