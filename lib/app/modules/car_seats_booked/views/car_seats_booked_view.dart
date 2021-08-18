import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/car_seats_booked/views/tabs/bookedseat_lower_tab.dart';
import 'package:ridethebee/app/modules/car_seats_booked/views/tabs/bookedseat_upper_tab.dart';

import '../controllers/car_seats_booked_controller.dart';

class CarSeatsBookedView extends GetView<CarSeatsBookedController> {

  CarSeatsBookedController _carSeatsBookedController = Get.put(CarSeatsBookedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: GetBuilder<CarSeatsBookedController>(
          id: "loading_state",
          init: CarSeatsBookedController(),
          builder: (loading_value) => Column(
            children: [
              SizedBox(height: MyConstant.headerTopMargin),
              Row(
                children: [
                  SizedBox(width: 10),
                  GestureDetector(
                    child: Container(
                      width: 55,
                      height: 55,
                      color: Colors.transparent,
                      child: Center(
                        child: Image.asset("assets/ic_new_back_yellow.png", height: 18, width: 18),
                      ),
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ),
                  Expanded(child: Text("Seat Chart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "PoppinsBold",
                          color: Color.fromRGBO(63, 61, 86, 1.0)
                      ))),
                  GestureDetector(
                    child: Container(
                      width: 55,
                      height: 55,
                      color: Colors.transparent,
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 8),

              !loading_value.isLoaded ? Expanded(child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),

                    SizedBox(height: 16),

                    Text("Loading . . .",
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1.0),
                            fontSize: 14,
                            fontFamily: "PoppinsMedium"
                        ))
                  ],
                ),
              )) : Expanded(child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/img_available_seat.png", width: 36, height: 36),
                          SizedBox(height: 16),
                          Text("Vacant",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "PoppinsRegular",
                                  color: Color.fromRGBO(63, 61, 86, 1.0)
                              ))
                        ],
                      ),

                      SizedBox(width: 55),

                      Column(
                        children: [
                          Image.asset("assets/img_booked_seat.png", width: 36, height: 36),
                          SizedBox(height: 16),
                          Text("Booked",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "PoppinsRegular",
                                  color: Color.fromRGBO(63, 61, 86, 1.0)
                              ))
                        ],
                      ),

                      SizedBox(width: 55),

                      Column(
                        children: [
                          Image.asset("assets/img_selected_seat.png", width: 36, height: 36),
                          SizedBox(height: 16),
                          Text("Selected",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "PoppinsRegular",
                                  color: Color.fromRGBO(63, 61, 86, 1.0)
                              ))
                        ],
                      )
                    ],
                  ),

                  Visibility(child: Column(
                    children: [
                      SizedBox(height: 8),

                      TabBar(
                        controller: _carSeatsBookedController.tabController,
                        unselectedLabelColor: Color.fromRGBO(63, 61, 86, 1.0),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: "PoppinsMedium"
                        ),
                        labelColor: Color.fromRGBO(255, 205, 56, 1.0),
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: "PoppinsBold"
                        ),
                        indicatorColor: Color.fromRGBO(255, 205, 56, 1.0),
                        indicatorWeight: 3.0,
                        tabs: <Widget>[
                          new Tab(text: "Lower Deck"),
                          new Tab(text: "Upper Deck"),
                        ],
                      )
                    ],
                  ), visible: loading_value.seatType != "Single Deck"),

                  SizedBox(height: 16),

                  Row(
                    children: [
                      SizedBox(width: 24),

                      Text("Seat (s)", style: TextStyle(
                          color: Color.fromRGBO(135, 141, 156, 1.0),
                          fontSize: 12,
                          fontFamily: "PoppinsRegular"
                      )),

                      SizedBox(width: 8),

                      Text(_carSeatsBookedController.strSelectedSeat, style: TextStyle(
                          color: Color.fromRGBO(63, 61, 86, 1.0),
                          fontSize: 16,
                          fontFamily: "PoppinsBold"
                      ))
                    ],
                  ),

                  loading_value.seatType != "Single Deck" ? Expanded(child: TabBarView(
                    controller: _carSeatsBookedController.tabController,
                    children: [
                       BookedSeatLowerTab(this._carSeatsBookedController),
                       BookedSeatUpperTab(this._carSeatsBookedController),
                    ],
                  ), flex: 1) : GetBuilder<CarSeatsBookedController>(
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
                      ), flex: 1)),
                ],
              ), flex: 1),

              SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}
