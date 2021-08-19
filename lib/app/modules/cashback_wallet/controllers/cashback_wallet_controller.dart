import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/cashback_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashbackWalletController extends GetxController with SingleGetTickerProviderMixin {
  //TODO: Implement CashbackWalletController

  final count = 0.obs;

  late TabController tabController;

  bool isLoading = true;
  String accessToken = "";
  String deviceId = "";
  String deviceToken = "";
  double cashbackBalance = 0.0;

  late List<CashbackModel> earnedCashbackList;
  late List<CashbackModel> redeemedCashbackList;

  bool isEarnedLoading = true;
  bool isRedeemedLoading = true;

  @override
  void onInit() {
    super.onInit();
    earnedCashbackList = [];
    redeemedCashbackList = [];
    tabController = TabController(vsync: this, length: 2);
    loadUser();
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
      deviceId = prefs.getString("device_id") ?? "";
      deviceToken = prefs.getString("firebase_token") ?? "";
      getBalance();
      loadEarnedCashback();
      loadRedeemedCashback();
    });
  }

  Future<void> getBalance() async {
    isLoading = true;
    update(["balance"]);

    Map body = new Map();
    body["device_id"] = deviceId;
    body["device_token"] = deviceToken;
    body["app_version"] = "1.0.0";

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).post(MyConstant.AUTHENTICATE,
        data: body).then((response) {

      Map responseMap = response.data;
      Map userMap = responseMap["user"];
      String cashbackBalance = userMap["cashback_balance"];
      this.cashbackBalance = double.parse(cashbackBalance);

      isLoading = false;
      update(["balance"]);
    }).catchError((error){
      if(error is DioError){
        print(error);
      }
      else{
        print(error);
      }
    });
  }

  void loadEarnedCashback(){
    isEarnedLoading = true;
    update(["earned_cashback"]);

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get("${MyConstant.EARNED_CASHBACK}?page=0").then((response) {
      Map responseMap = response.data;
      List<dynamic> dataList = responseMap["data"];

      for(int i = 0; i < dataList.length; i++){
        Map dataMap = dataList[i];

        int id = dataMap["id"] ?? 0;
        String amount = dataMap["amount"] ?? "";
        String date = dataMap["date"] ?? "";
        String client = dataMap["client"] ?? "";
        String client_img = dataMap["client_img"] ?? "";
        String from = dataMap["from"] ?? "";
        String to = dataMap["to"] ?? "";

        CashbackModel cashbackModel = CashbackModel(id, amount, date, client,
            client_img, from, to);
        earnedCashbackList.add(cashbackModel);
      }

      isEarnedLoading = false;
      update(["earned_cashback"]);
    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            print(error);
          }
          else{
            print(response);
          }

          print(response);
        }
        catch(error){
          print(error);
        }

        print(error);
      }
      else{
        print(error);
      }
      isEarnedLoading = false;
    });
  }

  void loadRedeemedCashback(){
    isRedeemedLoading = true;
    update(["redeemed_cashback"]);

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get("${MyConstant.REDEEMED_CASHBACK}?page=0").then((response) {
      Map responseMap = response.data;
      List<dynamic> dataList = responseMap["data"];

      for(int i = 0; i < dataList.length; i++){
        Map dataMap = dataList[i];

        int id = dataMap["id"] ?? 0;
        String amount = dataMap["amount"] ?? "";
        String date = dataMap["date"] ?? "";
        String client = dataMap["client"] ?? "";
        String client_img = dataMap["client_img"] ?? "";
        String from = dataMap["from"] ?? "";
        String to = dataMap["to"] ?? "";

        CashbackModel cashbackModel = CashbackModel(id, amount, date, client,
            client_img, from, to);
        redeemedCashbackList.add(cashbackModel);
      }

      isRedeemedLoading = false;
      update(["redeemed_cashback"]);
    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            print(error);
          }
          else{
            print(response);
          }

          print(response);
        }
        catch(error){
          print(error);
        }

        print(error);
      }
      else{
        print(error);
      }
      isRedeemedLoading = false;
    });
  }
}
