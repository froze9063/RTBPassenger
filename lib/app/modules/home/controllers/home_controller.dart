import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  late TextEditingController fromController;
  late TextEditingController toController;

  late List<String> paxList;
  bool isPaxListShowed = false;
  String selectedPax = "No. Of Pax";
  String selectedDate = "Select Date";

  bool departTimeDown = true;
  bool ticketPriceDown = true;

  void setSortPriceTime(bool isDown, int type){
    if(type == 0){
      departTimeDown = isDown;
      update(["depart_time"]);
    }
    else{
      ticketPriceDown = isDown;
      update(["ticket_price"]);
    }
  }

  @override
  void onInit() {
    paxList = [];
    fromController = TextEditingController();
    toController = TextEditingController();
    setPaxList();
    fromController.text = "Kuala Lumpur";
    toController.text = "Penang";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

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
  }

  void setPaxListShow(bool isSHow){
    this.isPaxListShowed = isSHow;
    update(["paxlist"]);
  }

  void setPax(String pax){
    this.selectedPax = pax;
    setPaxListShow(false);
    update(["pax"]);
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
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    this.selectedDate = dateFormat.format(dateTime);
    update(["select_date"]);
  }

  void switchLocation(){
    String lastSwitch = toController.text;
    toController.text = fromController.text;
    fromController.text = lastSwitch;
    update(["switch_location"]);
  }
}
