import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/driver_model.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/modules/filter_page/views/filter_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  late TextEditingController fromController;
  late TextEditingController toController;
  late TextEditingController paxController;

  late List<String> paxList;
  bool isPaxListShowed = false;
  String selectedPax = "No. Of Pax";
  String selectedDate = "Select Date";

  bool departTimeDown = true;
  bool ticketPriceDown = true;

  //Filter Parameter
  late List<TripModel> tripModelList;
  late TripModel tripModel;
  late DriverModel driverModel;

  String accessToken = "";
  int page = 0;
  String from = "";
  String to = "";
  String date = "";
  String orderBy = "";
  String orderValue = "";
  int pax = 0;

  String companyid = "";
  String pickupPoints = "";
  String dropoffPoints = "";
  int totalFilter = 0;

  bool isLoading = true;

  @override
  void onInit() {
    tripModelList = [];
    driverModel = DriverModel(0,"","","","");
    tripModel = TripModel(0, 0, 0, "", "", "", "", "", "", "", "", "",
        "", "", "","","", driverModel);

    paxList = [];
    fromController = TextEditingController();
    toController = TextEditingController();
    paxController = TextEditingController();
    setPaxList();
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
      companyid = prefs.getString("company_id") ?? "";
      pickupPoints = prefs.getString("pickup_points") ?? "";
      dropoffPoints = prefs.getString("dropoff_points") ?? "";
      print("access_token => $accessToken");
      totalFilter = 0;

      if(companyid.isNotEmpty){
        totalFilter = totalFilter + companyid.split(",").length;
      }

      if(pickupPoints.isNotEmpty){
        totalFilter = totalFilter + pickupPoints.split(",").length;
      }

      if(dropoffPoints.isNotEmpty){
        totalFilter = totalFilter + dropoffPoints.split(",").length;
      }

      update(["filter"]);
      searchTrips();
    });
  }

  void goToFilterPage(){
    Get.to(() => FilterPageView())?.then((value) {
      SharedPreferences.getInstance().then((prefs){
        totalFilter = 0;

        companyid = prefs.getString("company_id") ?? "";
        pickupPoints = prefs.getString("pickup_points") ?? "";
        dropoffPoints = prefs.getString("dropoff_points") ?? "";

        if(companyid.isNotEmpty){
          totalFilter = totalFilter + companyid.split(",").length;
        }

        if(pickupPoints.isNotEmpty){
          totalFilter = totalFilter + pickupPoints.split(",").length;
        }

        if(dropoffPoints.isNotEmpty){
          totalFilter = totalFilter + dropoffPoints.split(",").length;
        }

        update(["filter"]);
        searchTrips();
      });
    });
  }

  void setSortPriceTime(bool isDown, int type){
    if(type == 0){
      departTimeDown = isDown;
      update(["depart_time"]);

      orderBy = "depart_time";
      if(!isDown){
        orderValue = "desc";
      }
      else{
        orderValue = "asc";
      }

      searchTrips();
    }
    else{
      ticketPriceDown = isDown;
      update(["ticket_price"]);

      orderBy = "price";
      if(!isDown){
        orderValue = "desc";
      }
      else{
        orderValue = "asc";
      }

      searchTrips();
    }
  }

  void setPaxList(){
    paxList.add("No. Of Pax");
    paxList.add("1 Pax");
    paxList.add("2 Pax");
    paxList.add("3 Pax");
    paxList.add("4 Pax");
    paxList.add("5 Pax");
    paxList.add("6 Pax");
    paxList.add("7 Pax");
    paxList.add("8 Pax");
    paxList.add("9 Pax");
    paxList.add("10 Pax");

    paxList.add("11 Pax");
    paxList.add("12 Pax");
    paxList.add("13 Pax");
    paxList.add("14 Pax");
    paxList.add("15 Pax");
    paxList.add("16 Pax");
    paxList.add("17 Pax");
    paxList.add("18 Pax");
    paxList.add("19 Pax");
    paxList.add("20 Pax");

    paxList.add("21 Pax");
    paxList.add("22 Pax");
    paxList.add("23 Pax");
    paxList.add("24 Pax");
    paxList.add("25 Pax");
    paxList.add("26 Pax");
    paxList.add("27 Pax");
    paxList.add("28 Pax");
    paxList.add("29 Pax");
    paxList.add("30 Pax");
  }

  void setPaxListShow(bool isSHow){
    this.isPaxListShowed = isSHow;
    update(["paxlist"]);
  }

  void setPax(String pax){
    this.selectedPax = pax;
    setPaxListShow(false);
    update(["pax"]);

    if(selectedPax != "No. Of Pax"){
      this.pax = int.parse(selectedPax.split(" ")[0]);
    }
    else{
      this.pax = 0;
    }

    searchTrips();
  }

  void showCalendar(BuildContext context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      theme: ThemeData(primaryColor: Color.fromRGBO(255, 205, 56, 1.0),
          accentColor: Color.fromRGBO(255, 205, 56, 1.0)),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      textPositiveButton: "OK",
      textNegativeButton: "CANCEL",
    ).then((value) {
      if(value != null){
        setDate(value.millisecondsSinceEpoch );
      }
    });
  }

  void setDate(int date){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    this.selectedDate = dateFormat.format(dateTime);
    searchTrips();
    update(["select_date"]);
  }

  void switchLocation(){
    String lastSwitch = toController.text;
    toController.text = fromController.text;
    fromController.text = lastSwitch;
    searchTrips();
    update(["switch_location"]);
  }

  void searchTrips(){
    isLoading = true;

    update(["filter"]);

    if(selectedDate != "Select Date"){
      date = selectedDate;
    }

    String strPax = paxController.text.toString().trim();
    from = fromController.text.toString().trim();
    to = toController.text.toString().trim();

    if(strPax.isNotEmpty){
      pax = int.parse(strPax);
    }

    tripModelList.clear();

    String url = "${MyConstant.TRIPS}?page=$page";

    if(from.isNotEmpty){
      url = "$url&from=$from";
    }

    if(to.isNotEmpty){
      url = "$url&to=$to";
    }

    if(date.isNotEmpty){
      url = "$url&date=$date";
    }

    if(pax != 0){
      url = "$url&pax=$pax";
    }

    if(orderBy.isNotEmpty){
      url = "$url&order_by=$orderBy&order_value=$orderValue";
    }

    if(companyid.isNotEmpty){
      url = "$url&company_ids=$companyid";
    }

    if(pickupPoints.isNotEmpty){
      url = "$url&pickup_points=$pickupPoints";
    }

    if(dropoffPoints.isNotEmpty){
      url = "$url&dropoff_points=$dropoffPoints";
    }

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get(url).then((response) {
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

        tripModel = TripModel(id, 0, 0, date, depart_time, arrival_time,
            price, "", client, client_img, from, to, "", "",
            bus_no,"","", driverModel);
        tripModelList.add(tripModel);
      }

      isLoading = false;
      update(["filter"]);
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
      isLoading = false;
    });
  }
}
