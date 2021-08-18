import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/callback/rate_callback.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewController extends GetxController {

  final count = 0.obs;
  int starCount = 0;

  int tripId = 0;
  String accessToken = "";

  late TextEditingController rateEditingController;

  @override
  void onInit() {
    rateEditingController = TextEditingController();
    if(Get.arguments != null){
      if(Get.arguments["trip_id"] != null){
        tripId = Get.arguments["trip_id"];
      }
    }
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
    });
  }

  void setStar(int star){
    starCount = star;
    update(["star"]);
  }

  void review(RateCallback rateCallback){

    rateCallback.onRateLoading();

    MyConnection myConnection = new MyConnection();
    Map body = Map();
    body["id"] = tripId;
    body["rating"] = starCount;
    body["review"] = rateEditingController.text.toString().trim();

    myConnection.getDioConnection(accessToken).post("${MyConstant.RATE}", data: body).then((response) {
      Map responseMap = response.data;
      if(responseMap["success"] != null){
        String message = "Successfully Rate!";
        rateCallback.onRateSuccess(message,"success");
      }
      else{
        String message = responseMap["error"];
        rateCallback.onRateSuccess(message,"error");
      }
    }).catchError((error){
      if(error is DioError){
        rateCallback.onRateFailed(0,MyConstant.UNKNOWN_ERROR);
        print(error);
      }
      else{
        rateCallback.onRateFailed(0,MyConstant.UNKNOWN_ERROR);
        print(error);
      }
    });
  }
}
