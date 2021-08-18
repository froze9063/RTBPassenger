import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/modules/car_seats_booked/controllers/car_seats_booked_controller.dart';

class BookedSeatLowerTab extends StatelessWidget {

  CarSeatsBookedController _carSeatsBookedController;
  BookedSeatLowerTab(this._carSeatsBookedController);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarSeatsBookedController>(
        id: "select_seat",
        init: CarSeatsBookedController(),
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
                children: List.generate(_carSeatsBookedController.seatsList.length, (index) {
                  Map mapSeat = _carSeatsBookedController.seatsList[index];
                  return Center(
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
                  );
                }),
              ))
            ],
          ),
        ), flex: 1));
  }
}