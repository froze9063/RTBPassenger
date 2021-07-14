import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenController screenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(255, 205, 56, 1.0),
              Color.fromRGBO(255, 166, 0, 1.0)
            ]
          )
        ),
        child: Center(
          child: Image.asset("assets/img_splash_logo.png", height: 200,
              width: 200),
        ),
      ),
    );
  }
}
