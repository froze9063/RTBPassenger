import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterPageController extends GetxController {
  //TODO: Implement FilterPageController

  final count = 0.obs;

  late List<Map> companiesList;
  late List<Map> pickupList;
  late List<Map> dropoffList;

  bool isLoading = true;

  String accessToken = "";
  bool companyShowed = true;
  bool pickUpShowed = true;
  bool dropOffShowed = true;

  String companyid = "";
  String pickupPoints = "";
  String dropoffPoints = "";

  @override
  void onInit() {
    companiesList = [];
    pickupList = [];
    dropoffList = [];
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

      loadFilterList();
    });
  }

  void setShow(bool show, int type){
    if(type == 0){
      companyShowed = show;
      update(["companies"]);
    }
    else if(type == 1){
      pickUpShowed = show;
      update(["pick_up"]);
    }
    else{
      dropOffShowed = show;
      update(["drop_off"]);
    }
  }

  void setSelected(bool selected,int index, int type){
    if(type == 0){
      companiesList[index]["selected"] = selected;
      update(["companies"]);
    }
    else if(type == 1){
      pickupList[index]["selected"] = selected;
      update(["pick_up"]);
    }
    else{
      dropoffList[index]["selected"] = selected;
      update(["drop_off"]);
    }
  }

  void reset(){
    for(int i = 0 ; i < companiesList.length ; i++){
      companiesList[i]["selected"] = false;
    }

    for(int i = 0 ; i < pickupList.length ; i++){
      pickupList[i]["selected"] = false;
    }

    for(int i = 0 ; i < dropoffList.length ; i++){
      dropoffList[i]["selected"] = false;
    }

    update(["companies"]);
    update(["pick_up"]);
    update(["drop_off"]);
  }

  void filter(){
    SharedPreferences.getInstance().then((prefs){
      String strCompanyList = "";
      String strPickupList = "";
      String strDropoffList = "";

      for(int i = 0; i < companiesList.length; i++){
        Map companyMap = companiesList[i];
        bool selected = companyMap["selected"];
        int id = companyMap["id"];

        if(selected){
          strCompanyList = "$strCompanyList$id,";
        }
      }

      for(int i = 0; i < pickupList.length; i++){
        Map pickupMap = pickupList[i];
        bool selected = pickupMap["selected"];
        String name = pickupMap["name"];

        if(selected){
          strPickupList = "$strPickupList$name,";
        }
      }

      for(int i = 0; i < dropoffList.length; i++){
        Map dropoffMap = dropoffList[i];
        bool selected = dropoffMap["selected"];
        String name = dropoffMap["name"];

        if(selected){
          strDropoffList = "$strDropoffList$name,";
        }
      }

      if(strCompanyList.length > 0){
        strCompanyList = strCompanyList.substring(0,strCompanyList.length - 1);
      }

      if(strPickupList.length > 0){
        strPickupList = strPickupList.substring(0,strPickupList.length - 1);
      }

      if(strDropoffList.length > 0){
        strDropoffList = strDropoffList.substring(0,strDropoffList.length - 1);
      }

      prefs.setString("company_id", strCompanyList);
      prefs.setString("pickup_points", strPickupList);
      prefs.setString("dropoff_points", strDropoffList);

      Get.back();
    });
  }

  void loadFilterList(){

    isLoading = true;

    List<String> companyIdList = [];
    List<String> pickupNameList = [];
    List<String> dropoffNameList = [];

    if(companyid.isNotEmpty){
      companyIdList = companyid.split(",");
    }

    if(pickupPoints.isNotEmpty){
      pickupNameList = pickupPoints.split(",");
    }

    if(dropoffPoints.isNotEmpty){
      dropoffNameList = dropoffPoints.split(",");
    }

    String url = "${MyConstant.TRIPS}?page=0";

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get(url).then((response) {
      Map responseMap = response.data;
      List<dynamic> resultCompanyList = responseMap["companies"];
      List<dynamic> resultPickupList = responseMap["pickup_points"];
      List<dynamic> resultDropoffList = responseMap["dropoff_points"];

      for(int i = 0; i < resultCompanyList.length ; i++){
        Map dataMap = resultCompanyList[i];
        int id = dataMap["id"];
        String name = dataMap["name"];

        Map companyMap = Map();
        companyMap["id"] = id;
        companyMap["name"] = name;

        if(companyIdList.length > 0){
          for(int j = 0 ; j < companyIdList.length; j++){
            int selected_id = int.parse(companyIdList[j]);
            if(id == selected_id){
              companyMap["selected"] = true;
              break;
            }
            else{
              companyMap["selected"] = false;
            }
          }
        }
        else{
          companyMap["selected"] = false;
        }

        companiesList.add(companyMap);
      }

      for(int i = 0; i < resultPickupList.length ; i++){
        String name = resultPickupList[i];

        Map pickupMap = Map();
        pickupMap["name"] = name;

        if(pickupNameList.length > 0){
          for(int j = 0 ; j < pickupNameList.length; j++){
            String selected_name = pickupNameList[j];
            if(name == selected_name){
              pickupMap["selected"] = true;
              break;
            }
            else{
              pickupMap["selected"] = false;
            }
          }
        }
        else{
          pickupMap["selected"] = false;
        }

        pickupList.add(pickupMap);
      }

      for(int i = 0; i < resultDropoffList.length ; i++){
        String name = resultDropoffList[i];

        Map dropoffMap = Map();
        dropoffMap["name"] = name;

        if(dropoffNameList.length > 0){
          for(int j = 0 ; j < dropoffNameList.length; j++){
            String selected_name = dropoffNameList[j];
            if(name == selected_name){
              dropoffMap["selected"] = true;
              break;
            }
            else{
              dropoffMap["selected"] = false;
            }
          }
        }
        else{
          dropoffMap["selected"] = false;
        }

        dropoffList.add(dropoffMap);
      }

      isLoading = false;
      update(["companies","pick_up","drop_off"]);
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
