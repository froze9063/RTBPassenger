import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/modules/ticket_details_seat/views/ticket_details_seat_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarSeatsController extends GetxController with SingleGetTickerProviderMixin {

  final count = 0.obs;

  List<Map> seatsList = [];
  List<Map> upperList = [];

  List<String> singleAlphabet = [];
  /*List<String> singleAlphabet = ["A","B","C","D","E","F","G","H","I","J","K",
    "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];*/

  List<String> singleLowerAlphabet = [];
  /*List<String> singleLowerAlphabet = ["AL","BL","CL","DL","EL","FL","GL","HL","IL","JL","KL",
    "LL","ML","NL","OL","PL","QL","RL","SL","TL","UL","VL","WL","XL","YL","ZL"];*/

  List<String> singleUpperAlphabet = [];
  /*List<String> singleUpperAlphabet = ["AU","BU","CU","DU","EU","FU","GU","HU","IU","JU","KU",
    "LU","MU","NU","OU","PU","QU","RU","SU","TU","UU","VU","WU","XU","YU","ZU"];*/

  int selectedSeat = -1;
  int tripId = 0;

  String accessToken = "";
  String strSelectedSeat = "-";
  String strPrice = "0.0";

  List<Map> selectedSeatList = [];
  late TripModel tripModel;

  late TabController tabController;
  bool isLoaded = false;
  String seatType = "Single Deck";

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);

    if(Get.arguments != null){
      if(Get.arguments["trip_id"] != null){
        tripId = Get.arguments["trip_id"];
      }

      if(Get.arguments["trip_model"] != null){
        tripModel = Get.arguments["trip_model"];
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
      loadSeats();
    });
  }

  void gotoDetailBookSeat(){
    Get.to(() => TicketDetailsSeatView(), arguments: {"trip_model" : tripModel,
      "seat_list" : strSelectedSeat, "price" : strPrice});
  }

  String parseSeatImage(int type){
      if(type == 0){
        return "assets/img_available_seat.png";
      }
      else if(type == 1){
        return "assets/img_booked_seat.png";
      }
      else{
        return "assets/img_selected_seat.png";
      }
  }

  void selectSeat(int index, int from){
    if(from == 0){
      Map selectedMap = seatsList[index];
      int type = selectedMap["type"];
      if(type == 0){
        seatsList[index]["type"] = 3;
        selectedSeatList.add(selectedMap);
      }
      else{
        seatsList[index]["type"] = 0;
        selectedSeatList.remove(selectedMap);
      }
    }
    else{
      Map selectedMap = upperList[index];
      int type = selectedMap["type"];
      if(type == 0){
        upperList[index]["type"] = 3;
        selectedSeatList.add(selectedMap);
      }
      else{
        upperList[index]["type"] = 0;
        selectedSeatList.remove(selectedMap);
      }
    }

    String strSeats = "";
    if(selectedSeatList.length > 0){
      for(int i = 0; i < selectedSeatList.length ; i++){
         Map dataMap = selectedSeatList[i];
         String name = dataMap["name"];

         if(i != selectedSeatList.length - 1){
           strSeats = "$strSeats$name,";
         }
         else{
           strSeats = "$strSeats$name";
         }
      }
    }
    else{
      strSeats = "-";
    }

    double price = double.parse(tripModel.price);
    strPrice = (price * selectedSeatList.length).toString();
    strSelectedSeat = strSeats;
    update(["select_seat","seat_list"]);
  }

  void loadSeats(){
    isLoaded = false;

    update(["loading_state"]);

    this.singleAlphabet.clear();
    this.singleLowerAlphabet.clear();
    this.singleUpperAlphabet.clear();
    this.seatsList.clear();

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get("${MyConstant.TRIPS_SEATS}$tripId").then((response) {
      Map responseMap = response.data;
      Map dataMap = responseMap["data"];

      String type = dataMap["type"];
      seatType = type;

      if(type == "Single Deck") {
        List<dynamic> seatsList = dataMap["seats"];
        for (int i = 0; i < seatsList.length; i++) {
          Map seatMap = seatsList[i];
          Map leftMap = seatMap["left"];
          String key = leftMap.keys.first;
          String strKey = key.split("")[0];
          singleAlphabet.add(strKey);
        }
      }
      else{
        Map seatMap = dataMap["seats"];
        List<dynamic> seatsList = seatMap["lower_deck"];
        List<dynamic> upperList = seatMap["upper_deck"];

        for(int i = 0 ; i < seatsList.length; i++) {
          Map seatMap = seatsList[i];
          Map leftMap = seatMap["left"];
          String key = leftMap.keys.first;;
          String strKey = "${key.split("")[0]}${key.split("")[1]}";
          singleLowerAlphabet.add(strKey);
        }

        for(int i = 0 ; i < upperList.length; i++) {
          Map seatMap = upperList[i];
          Map leftMap = seatMap["left"];
          String key = leftMap.keys.first;;
          String strKey = "${key.split("")[0]}${key.split("")[1]}";
          singleUpperAlphabet.add(strKey);
        }
      }

      if(type == "Single Deck"){
        List<dynamic> seatsList = dataMap["seats"];
        for(int i = 0 ; i < seatsList.length; i++){
          Map seatMap = seatsList[i];
          Map leftMap = seatMap["left"];
          Map rightMap = seatMap["right"];

          if(leftMap["${singleAlphabet[i]}1"] != null){
            bool left1 = leftMap["${singleAlphabet[i]}1"];
            Map left1Map = Map();
            left1Map["name"] = "${singleAlphabet[i]}1";
            left1Map["type"] = left1 ? 0 : 1;
            this.seatsList.add(left1Map);
          }

          if(leftMap["${singleAlphabet[i]}2"] != null){
            bool left2 = leftMap["${singleAlphabet[i]}2"];
            Map left2Map = Map();
            left2Map["name"] = "${singleAlphabet[i]}2";
            left2Map["type"] = left2 ? 0 : 1;
            this.seatsList.add(left2Map);
          }

          if(rightMap["${singleAlphabet[i]}3"] != null){
            bool right1 = rightMap["${singleAlphabet[i]}3"];
            Map right3Map = Map();
            right3Map["name"] = "${singleAlphabet[i]}3";
            right3Map["type"] = right1 ? 0 : 1;
            this.seatsList.add(right3Map);
          }

          if(rightMap["${singleAlphabet[i]}4"] != null){
            bool right2 = rightMap["${singleAlphabet[i]}4"];
            Map right4Map = Map();
            right4Map["name"] = "${singleAlphabet[i]}4";
            right4Map["type"] = right2 ? 0 : 1;
            this.seatsList.add(right4Map);
          }
        }
      }
      else{
        Map seatMap = dataMap["seats"];
        List<dynamic> seatsList = seatMap["lower_deck"];
        List<dynamic> upperList = seatMap["upper_deck"];

        for(int i = 0 ; i < seatsList.length; i++){
          Map seatMap = seatsList[i];
          Map leftMap = seatMap["left"];
          Map rightMap = seatMap["right"];

          if(leftMap["${singleLowerAlphabet[i]}1"] != null){
            bool left1 = leftMap["${singleLowerAlphabet[i]}1"];
            Map left1Map = Map();
            left1Map["name"] = "${singleLowerAlphabet[i]}1";
            left1Map["type"] = left1 ? 0 : 1;
            this.seatsList.add(left1Map);
          }

          if(leftMap["${singleLowerAlphabet[i]}2"] != null){
            bool left2 = leftMap["${singleLowerAlphabet[i]}2"];
            Map left2Map = Map();
            left2Map["name"] = "${singleLowerAlphabet[i]}2";
            left2Map["type"] = left2 ? 0 : 1;
            this.seatsList.add(left2Map);
          }

          if(rightMap["${singleLowerAlphabet[i]}3"] != null){
            bool right1 = rightMap["${singleLowerAlphabet[i]}3"];
            Map right3Map = Map();
            right3Map["name"] = "${singleLowerAlphabet[i]}3";
            right3Map["type"] = right1 ? 0 : 1;
            this.seatsList.add(right3Map);
          }

          if(rightMap["${singleLowerAlphabet[i]}4"] != null){
            bool right2 = rightMap["${singleLowerAlphabet[i]}4"];
            Map right4Map = Map();
            right4Map["name"] = "${singleLowerAlphabet[i]}4";
            right4Map["type"] = right2 ? 0 : 1;
            this.seatsList.add(right4Map);
          }
        }

        for(int i = 0 ; i < upperList.length; i++){
          Map seatMap = upperList[i];
          Map leftMap = seatMap["left"];
          Map rightMap = seatMap["right"];

          if(leftMap["${singleUpperAlphabet[i]}1"] != null){
            bool left1 = leftMap["${singleUpperAlphabet[i]}1"];
            Map left1Map = Map();
            left1Map["name"] = "${singleUpperAlphabet[i]}1";
            left1Map["type"] = left1 ? 0 : 1;
            this.upperList.add(left1Map);
          }

          if(leftMap["${singleUpperAlphabet[i]}2"] != null){
            bool left2 = leftMap["${singleUpperAlphabet[i]}2"];
            Map left2Map = Map();
            left2Map["name"] = "${singleUpperAlphabet[i]}2";
            left2Map["type"] = left2 ? 0 : 1;
            this.upperList.add(left2Map);
          }

          if(rightMap["${singleUpperAlphabet[i]}3"] != null){
            bool right1 = rightMap["${singleUpperAlphabet[i]}3"];
            Map right3Map = Map();
            right3Map["name"] = "${singleUpperAlphabet[i]}3";
            right3Map["type"] = right1 ? 0 : 1;
            this.upperList.add(right3Map);
          }

          if(rightMap["${singleUpperAlphabet[i]}4"] != null){
            bool right2 = rightMap["${singleUpperAlphabet[i]}4"];
            Map right4Map = Map();
            right4Map["name"] = "${singleUpperAlphabet[i]}4";
            right4Map["type"] = right2 ? 0 : 1;
            this.upperList.add(right4Map);
          }
        }
      }
      isLoaded = true;
      update(["select_seat","loading_state"]);
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
    });
  }
}
