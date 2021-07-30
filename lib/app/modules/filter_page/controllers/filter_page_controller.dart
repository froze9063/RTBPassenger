import 'package:get/get.dart';

class FilterPageController extends GetxController {
  //TODO: Implement FilterPageController

  final count = 0.obs;

  late List<Map> companiesList;
  late List<Map> pickupList;
  late List<Map> dropoffList;

  bool companyShowed = true;
  bool pickUpShowed = true;
  bool dropOffShowed = true;

  @override
  void onInit() {
    companiesList = [];
    pickupList = [];
    dropoffList = [];
    initCompany();
    initPickup();
    initDropOff();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

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

  void initCompany(){
    Map map = Map();
    map["name"] = "Ride The Bee";
    map["selected"] = false;

    Map map1 = Map();
    map1["name"] = "Warren Bus Service";
    map1["selected"] = false;

    Map map2 = Map();
    map2["name"] = "JN Bird Buses";
    map2["selected"] = false;

    companiesList.add(map);
    companiesList.add(map1);
    companiesList.add(map2);
  }


  void initPickup(){
    Map map = Map();
    map["name"] = "TBS (Terminal Bersepadu Selatan)";
    map["selected"] = false;

    Map map1 = Map();
    map1["name"] = "Bus Terminal Pekeliling";
    map1["selected"] = false;

    Map map2 = Map();
    map2["name"] = "Kota Raya Bus Terminal";
    map2["selected"] = false;

    pickupList.add(map);
    pickupList.add(map1);
    pickupList.add(map2);
  }

  void initDropOff(){
    Map map = Map();
    map["name"] = "Komtar Bus Terminal";
    map["selected"] = false;

    Map map1 = Map();
    map1["name"] = "Bus Stop Jalan Perak";
    map1["selected"] = false;

    Map map2 = Map();
    map2["name"] = "Penang Times Square";
    map2["selected"] = false;

    dropoffList.add(map);
    dropoffList.add(map1);
    dropoffList.add(map2);
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
}
