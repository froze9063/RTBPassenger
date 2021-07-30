import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final count = 0.obs;
  late List<Map> notifList;

  @override
  void onInit() {
    notifList = [];
    setNotifList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setNotifList(){
    Map notif1 = Map();
    notif1["color"] = Colors.white;
    notif1["read"] = 0;

    Map notif2 = Map();
    notif2["color"] = Colors.white;
    notif2["read"] = 0;

    Map notif3 = Map();
    notif3["color"] = Colors.white;
    notif3["read"] = 0;

    Map notif4 = Map();
    notif4["color"] = Colors.white;
    notif4["read"] = 0;

    Map notif5 = Map();
    notif5["color"] = Colors.white;
    notif5["read"] = 0;

    Map notif6 = Map();
    notif6["color"] = Colors.white;
    notif6["read"] = 0;

    Map notif7 = Map();
    notif7["color"] = Colors.white;
    notif7["read"] = 0;

    Map notif8 = Map();
    notif8["color"] = Colors.white;
    notif8["read"] = 0;

    notifList.add(notif1);
    notifList.add(notif2);
    notifList.add(notif3);
    notifList.add(notif4);
    //notifList.add(notif5);
    //notifList.add(notif6);
    //messageList.add(message7);
    // messageList.add(message8);
  }

  void changeNotifColor(Color color, int index){
    notifList[index]["color"] = color;
    update(["notification"]);
  }
}

