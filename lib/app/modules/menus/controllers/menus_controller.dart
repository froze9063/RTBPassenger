import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenusController extends GetxController {
  //TODO: Implement MenusController

  final count = 0.obs;

  Color searchColor = Colors.white;
  Color cashbackColor = Colors.white;
  Color completedColor = Colors.white;
  Color upcomingColor = Colors.white;
  Color ongoingColor = Colors.white;

  String name = "";
  String email = "";
  String urlImage = "";

  bool isLoading = true;
  String accessToken = "";
  String deviceId = "";
  String deviceToken = "";
  int trip_id = 0;

  @override
  void onInit() {
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
      accessToken = prefs.getString("access_token") ?? "";
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";
      urlImage = prefs.getString("img") ?? "";
      deviceId = prefs.getString("device_id") ?? "";
      deviceToken = prefs.getString("firebase_token") ?? "";
      getOnGoingTrip();
      update(["profile"]);
    });
  }

  void setSearchColor(Color color){
    this.searchColor = color;
    update(["search_color"]);
  }

  void setCashbackColor(Color color){
    this.cashbackColor = color;
    update(["cashback_color"]);
  }

  void setOnGoing(Color color){
    this.ongoingColor = color;
    update(["ongoing_color"]);
  }

  void setUpcomingColor(Color color){
    this.upcomingColor = color;
    update(["upcoming_color"]);
  }

  void setCompletedColor(Color color){
    this.completedColor = color;
    update(["completed_color"]);
  }

  Future<void> getOnGoingTrip() async {
    isLoading = true;
    update(["trip_id"]);

    Map body = new Map();
    body["device_id"] = deviceId;
    body["device_token"] = deviceToken;
    body["app_version"] = "1.0.0";

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).post(MyConstant.AUTHENTICATE,
        data: body).then((response) {

      Map responseMap = response.data;
      Map userMap = responseMap["user"];

      if(userMap["trip_id"] != null){
        trip_id = userMap["trip_id"];
      }

      isLoading = false;
      update(["trip_id"]);
    }).catchError((error){
      if(error is DioError){
        print(error);
      }
      else{
        print(error);
      }
    });
  }
}
