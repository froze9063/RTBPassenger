import 'package:get/get.dart';

class CarSeatsController extends GetxController {

  final count = 0.obs;

  List<Map> seatsList = [];

  int selectedSeat = -1;

  @override
  void onInit() {
    Map map1 = Map();
    map1["type"] = 0;

    Map map2 = Map();
    map2["type"] = 0;

    Map map3 = Map();
    map3["type"] = 0;

    Map map4 = Map();
    map4["type"] = 0;

    Map map5 = Map();
    map5["type"] = 0;

    Map map6 = Map();
    map6["type"] = 0;

    Map map7 = Map();
    map7["type"] = 0;

    Map map8 = Map();
    map8["type"] = 0;

    Map map9 = Map();
    map9["type"] = 0;

    Map map10 = Map();
    map10["type"] = 0;

    Map map11 = Map();
    map11["type"] = 1;

    Map map12 = Map();
    map12["type"] = 1;

    Map map13 = Map();
    map13["type"] = 0;

    Map map14 = Map();
    map14["type"] = 0;

    Map map15 = Map();
    map15["type"] = 0;

    Map map16 = Map();
    map16["type"] = 0;

    Map map17 = Map();
    map17["type"] = 0;

    Map map18 = Map();
    map18["type"] = 0;

    Map map19 = Map();
    map19["type"] = 0;

    Map map20 = Map();
    map20["type"] = 0;

    Map map21 = Map();
    map21["type"] = 0;

    Map map22 = Map();
    map22["type"] = 0;

    Map map23 = Map();
    map23["type"] = 1;

    Map map24 = Map();
    map24["type"] = 0;

    Map map25 = Map();
    map25["type"] = 0;

    Map map26 = Map();
    map26["type"] = 0;

    Map map27 = Map();
    map27["type"] = 0;

    Map map28 = Map();
    map28["type"] = 0;

    Map map29 = Map();
    map29["type"] = 0;

    Map map30 = Map();
    map30["type"] = 0;

    Map map31 = Map();
    map31["type"] = 0;

    Map map32 = Map();
    map32["type"] = 1;

    seatsList.add(map1);
    seatsList.add(map2);
    seatsList.add(map3);
    seatsList.add(map4);
    seatsList.add(map5);
    seatsList.add(map6);
    seatsList.add(map7);
    seatsList.add(map8);
    seatsList.add(map9);
    seatsList.add(map10);
    seatsList.add(map11);
    seatsList.add(map12);
    seatsList.add(map13);
    seatsList.add(map14);
    seatsList.add(map15);
    seatsList.add(map16);
    seatsList.add(map17);
    seatsList.add(map18);
    seatsList.add(map19);
    seatsList.add(map20);
    seatsList.add(map21);
    seatsList.add(map22);
    seatsList.add(map23);
    seatsList.add(map24);
    seatsList.add(map25);
    seatsList.add(map26);
    seatsList.add(map27);
    seatsList.add(map28);
    seatsList.add(map29);
    seatsList.add(map30);
    seatsList.add(map31);
    seatsList.add(map32);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

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

  void selectSeat(int seat){
    this.selectedSeat = seat;
    update(["select_seat"]);
  }
}
