import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/modules/car_seats/controllers/car_seats_controller.dart';

class UpperTab extends StatelessWidget {

  CarSeatsController _carSeatsController;
  UpperTab(this._carSeatsController);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarSeatsController>(
        id: "select_seat",
        init: CarSeatsController(),
        builder: (value) =>  Expanded(child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Image.asset("assets/img_seat_background.png", width: double.maxFinite,
                  height: double.maxFinite, fit: BoxFit.fill),

              Padding(padding: EdgeInsets.all(36), child:  GridView.count(
                childAspectRatio: 1.65,
                crossAxisCount: 4,
                padding: EdgeInsets.zero,
                children: List.generate(_carSeatsController.upperList.length, (index) {
                  Map mapSeat = _carSeatsController.upperList[index];
                  return GestureDetector(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(child: Text("${mapSeat["name"]}", style: TextStyle(
                            fontFamily: "PoppinsRegular",
                          )), visible: index % 2 == 0),
                          SizedBox(width: 4),
                          Image.asset(value.selectedSeat == index ? "assets/img_selected_seat.png" :
                          value.parseSeatImage(mapSeat["type"]), width: 36, height: 36),
                          SizedBox(width: 4),
                          Visibility(child: Text(mapSeat["name"], style: TextStyle(
                            fontFamily: "PoppinsRegular",
                          )), visible: index % 2 != 0),
                        ],
                      ),
                    ),
                    onTap: (){
                      if(mapSeat["type"] == 0 || mapSeat["type"] == 3){
                        value.selectSeat(index,1);
                      }
                    },
                  );
                }),
              ))
            ],
          ),
        ), flex: 1));
  }
}