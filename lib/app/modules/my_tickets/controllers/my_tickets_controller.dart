import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTicketsController extends GetxController with SingleGetTickerProviderMixin{
  //TODO: Implement MyTicketsController

  final count = 0.obs;

  late TabController tabController;
  int tab_type = 0;

  late List<String> filterList;
  bool isFilterListShowed = false;
  String selectedFilter = "Today";

  @override
  void onInit() {
    filterList = [];
    tab_type = Get.arguments["tab_type"];
    tabController = TabController(vsync: this, length: 2);
    setFilterList();
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
}
