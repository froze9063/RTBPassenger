import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";
      urlImage = prefs.getString("img") ?? "";
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
}
