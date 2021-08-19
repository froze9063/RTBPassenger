import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/driver_model.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTicketsController extends GetxController with SingleGetTickerProviderMixin{
  //TODO: Implement MyTicketsController

  final count = 0.obs;

  late TabController tabController;
  int tab_type = 0;

  late List<String> filterList;
  bool isFilterListShowed = false;

  String selectedFilter = "Today";
  String accessToken = "";

  late DriverModel driverModel;

  bool isUpcomingLoading = true;
  late List<TripModel> upcomingTripModelList;

  bool isCompletedLoading = true;
  late List<TripModel> completedTripModelList;

  @override
  void onInit() {
    driverModel = DriverModel(0,"","","","");
    filterList = [];
    upcomingTripModelList = [];
    completedTripModelList = [];
    tab_type = Get.arguments["tab_type"];
    tabController = TabController(vsync: this, length: 2);
    setFilterList();
    loadUser();
    super.onInit();
  }

  @override
  void onReady() {
    if(tab_type == 0){
      tabController.animateTo(0);
    }
    else{
      tabController.animateTo(1);
    }
    update(["tab_bar"]);
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void loadUser(){
    SharedPreferences.getInstance().then((prefs){
      accessToken = prefs.getString("access_token") ?? "";
      loadUpcomingTicket();
      loadCompletedTicket();
    });
  }

  void setFilterList(){
    filterList.add("Today");
    filterList.add("This Week");
    filterList.add("This Month");
  }

  void setFilterListShow(bool isSHow){
    this.isFilterListShowed = isSHow;
    update(["filterlist"]);
  }

  void setFilter(String filter){
    this.selectedFilter = filter;
    setFilterListShow(false);
    update(["filter"]);
  }

  void loadUpcomingTicket(){
    isUpcomingLoading = true;
    update(["upcoming_ticket"]);

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get("${MyConstant.UPCOMING_TICKET}?page=0").then((response) {
      Map responseMap = response.data;
      List<dynamic> dataList = responseMap["data"];

      for(int i = 0; i < dataList.length; i++){
        Map dataMap = dataList[i];
        int id = dataMap["id"] ?? 0;
        String depart_time = dataMap["depart_time"] ?? "";
        String arrival_time = dataMap["arrival_time"] ?? "";
        String price = dataMap["price"] ?? "";
        String client = dataMap["client"] ?? "";
        String client_img = dataMap["client_img"] ?? "";
        String bus_no = dataMap["bus_no"] ?? "";
        String from = dataMap["from"] ?? "";
        String to = dataMap["to"] ?? "";

        TripModel tripModel = TripModel(id, 0, 0, "", depart_time, arrival_time,
            price, "", client, client_img, from, to, "", "",
            bus_no, "","",driverModel);

        upcomingTripModelList.add(tripModel);
      }

      isUpcomingLoading = false;
      update(["upcoming_ticket"]);
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
      isUpcomingLoading = false;
    });
  }

  void loadCompletedTicket(){
    isCompletedLoading = true;
    update(["completed_ticket"]);

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get("${MyConstant.COMPLETED_TICKET}?page=0").then((response) {
      Map responseMap = response.data;
      List<dynamic> dataList = responseMap["data"];

      for(int i = 0; i < dataList.length; i++){
        Map dataMap = dataList[i];
        int id = dataMap["id"] ?? 0;
        String depart_time = dataMap["depart_time"] ?? "";
        String arrival_time = dataMap["arrival_time"] ?? "";
        String price = dataMap["price"] ?? "";
        String client = dataMap["client"] ?? "";
        String client_img = dataMap["client_img"] ?? "";
        String bus_no = dataMap["bus_no"] ?? "";
        String from = dataMap["from"] ?? "";
        String to = dataMap["to"] ?? "";

        TripModel tripModel = TripModel(id, 0, 0, "", depart_time, arrival_time,
            price, "", client, client_img, from, to, "", "",
            bus_no, "","", driverModel);

        completedTripModelList.add(tripModel);
      }

      isCompletedLoading = false;
      update(["completed_ticket"]);
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
      isCompletedLoading = false;
    });
  }
}
