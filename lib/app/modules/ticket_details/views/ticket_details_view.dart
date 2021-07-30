import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/car_seats_booked/views/car_seats_booked_view.dart';
import 'package:ridethebee/app/modules/en_route/views/en_route_view.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/ticket_details_controller.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {

  TicketDetailsController _ticketDetailsController = Get.put(TicketDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/home_background.png", width: double.maxFinite,
              height: double.maxFinite, fit: BoxFit.fill),

          Container(
            padding: EdgeInsets.only(bottom: 24,
                top: MyConstant.headerTopMargin),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.transparent,
                        child: Center(
                          child: Image.asset("assets/ic_menu.png", height: 28, width: 28),
                        ),
                      ),
                      onTap: (){
                        Get.to(() => MenusView());
                      },
                    ),
                    Expanded(child: SizedBox(), flex: 1),
                    Text("Booking Details", style: TextStyle(
                        fontSize: 18,
                        fontFamily: "PoppinsBold",
                        color: Color.fromRGBO(63, 61, 86, 1.0)
                    )),
                    Expanded(child: SizedBox(), flex: 1),
                    GestureDetector(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.transparent,
                        child: Center(
                          child: Image.asset("assets/ic_notification.png", height: 28, width: 28),
                        ),
                      ),
                      onTap: (){
                        Get.to(() => NotificationView());
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),

                Expanded(child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      margin: EdgeInsets.only(bottom: 16, left: 24, right: 24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(left: 24,right: 24,top: 10,bottom: 10),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(225, 225, 232, 1.0),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                            ),
                            child: Stack(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 6), child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/ic_bus.png", width: 16, height: 16, fit: BoxFit.cover),
                                    SizedBox(width: 8),
                                    Text("SAB 4124",
                                        style: TextStyle(
                                            color: Color.fromRGBO(35, 35, 35, 1.0),
                                            fontSize: 14,
                                            fontFamily: "PoppinsMedium"
                                        ))
                                  ],
                                ))
                              ],
                            ),
                          ),

                          Expanded(child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 24),
                                    Expanded(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 24),

                                        Text("Depart", style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "PoppinsRegular",
                                            color: Color.fromRGBO(135, 141, 156, 1.0)
                                        )),

                                        Text("1:05 PM", style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "PoppinsBold",
                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                        )),

                                        Text("12 June, Mon", style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "PoppinsRegular",
                                            color: Color.fromRGBO(135, 141, 156, 1.0)
                                        ))
                                      ],
                                    ), flex: 1),

                                    Expanded(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 24),

                                        Text("Arrive", style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "PoppinsRegular",
                                            color: Color.fromRGBO(135, 141, 156, 1.0)
                                        )),

                                        Text("1:05 PM", style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "PoppinsBold",
                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                        )),

                                        Text("12 June, Mon", style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "PoppinsRegular",
                                            color: Color.fromRGBO(135, 141, 156, 1.0)
                                        ))
                                      ],
                                    ), flex: 1),

                                    SizedBox(width: 24),
                                  ],
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                                  width: double.maxFinite,
                                  height: 1,
                                  color: Color.fromRGBO(240, 240, 239, 1.0),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset("assets/ic_yellow_circle.png", width: 16, height: 16),
                                          SizedBox(height: 8),
                                          Image.asset("assets/ic_dots.png", width: 8, height: 55),
                                          SizedBox(height: 8),
                                          Image.asset("assets/ic_end_dot.png", width: 16, height: 16),
                                        ],
                                      ),

                                      SizedBox(width: 16),

                                      Expanded(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Kuala Lumpur", style: TextStyle(
                                              color: Color.fromRGBO(135, 141, 156, 1.0),
                                              fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(height: 8),
                                          Text("TBS (Terminal Bersepadu Selatan)", style: TextStyle(
                                              color: Color.fromRGBO(63, 61, 86, 1.0),
                                              fontSize: 16,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(height: 16),
                                          Container(
                                            width: double.maxFinite,
                                            height: 1,
                                            color: Color.fromRGBO(236, 239, 241, 1.0),
                                          ),
                                          SizedBox(height: 16),
                                          Text("Penang", style: TextStyle(
                                              color: Color.fromRGBO(135, 141, 156, 1.0),
                                              fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(height: 8),
                                          Text("Sungai Nibong Bus Terminal", style: TextStyle(
                                              color: Color.fromRGBO(63, 61, 86, 1.0),
                                              fontSize: 16,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                        ],
                                      ), flex: 1),

                                      SizedBox(width: 16),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 24, right: 24,bottom: 16),
                                  width: double.maxFinite,
                                  height: 1,
                                  color: Color.fromRGBO(236, 239, 241, 1.0),
                                ),

                                Row(
                                  children: [
                                    SizedBox(width: 24),
                                    Expanded(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Company", style: TextStyle(
                                            color: Color.fromRGBO(135, 141, 156, 1.0),
                                            fontSize: 12,
                                            fontFamily: "PoppinsRegular"
                                        )),
                                        SizedBox(height: 8),
                                        Text("Ride The Bee", style: TextStyle(
                                            color: Color.fromRGBO(63, 61, 86, 1.0),
                                            fontSize: 16,
                                            fontFamily: "PoppinsMedium"
                                        ))
                                      ],
                                    ), flex: 1),
                                    Image.asset("assets/img_ridethebees.png",height: 30,width: 30, fit: BoxFit.cover),
                                    SizedBox(width: 16)
                                  ],
                                ),

                                SizedBox(height: 8),

                                Row(
                                  children: [
                                    SizedBox(width: 24),
                                    Expanded(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Seat (s)", style: TextStyle(
                                            color: Color.fromRGBO(135, 141, 156, 1.0),
                                            fontSize: 12,
                                            fontFamily: "PoppinsRegular"
                                        )),
                                        Text("D3", style: TextStyle(
                                            color: Color.fromRGBO(63, 61, 86, 1.0),
                                            fontSize: 16,
                                            fontFamily: "PoppinsBold"
                                        ))
                                      ],
                                    ), flex: 1),
                                    GestureDetector(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("View Seating", style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "PoppinsMedium",
                                              color: Color.fromRGBO(255, 205, 56, 1.0)
                                          )),
                                          SizedBox(width: 16),
                                          Image.asset("assets/ic_yellow_right.png", height: 24,width: 24),
                                          SizedBox(width: 16)
                                        ],
                                      ),
                                      onTap: (){
                                        Get.to(() => CarSeatsBookedView());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ), flex: 1),

                          SizedBox(height: 75),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 24),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pick-up point", style: TextStyle(
                                      color: Color.fromRGBO(135, 141, 156, 1.0),
                                      fontSize: 14,
                                      fontFamily: "PoppinsRegular"
                                  )),

                                  SizedBox(height: 8),

                                  Text("Bay 5", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0),
                                      fontSize: 18,
                                      fontFamily: "PoppinsMedium"
                                  ))
                                ],
                              ),

                              Expanded(child: SizedBox(), flex: 1),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Drop-off point", style: TextStyle(
                                      color: Color.fromRGBO(135, 141, 156, 1.0),
                                      fontSize: 14,
                                      fontFamily: "PoppinsRegular"
                                  )),

                                  SizedBox(height: 8),

                                  Text("Bay 1", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0),
                                      fontSize: 18,
                                      fontFamily: "PoppinsMedium"
                                  ))
                                ],
                              ),

                              SizedBox(width: 24)
                            ],
                          ),

                          SizedBox(height: 24)
                        ],
                      ),
                    ),

                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                        children: [
                          Expanded(child: SizedBox(),flex: 1),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 201, 41, 1.0),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(45),
                                        bottomRight: Radius.circular(45))
                                ),
                              ),

                              Expanded(child: Column(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: 1,
                                    color: Color.fromRGBO(236, 239, 241, 1.0),
                                  ),

                                  SizedBox(height: 32),

                                  Container(
                                    width: double.maxFinite,
                                    height: 1,
                                    color: Color.fromRGBO(236, 239, 241, 1.0),
                                  ),
                                ],
                              ), flex: 1),

                              Container(
                                width: 40,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 201, 41, 1.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45),
                                        bottomLeft: Radius.circular(45))
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 125)
                        ],
                      ),
                    )
                  ],
                ), flex: 1),

                Padding(padding: EdgeInsets.only(bottom: 0, left: 24, right: 24), child: GestureDetector(
                  child: ColoredButton(height: 55, width: double.maxFinite,
                      title: "View Map",
                      color: Color.fromRGBO(63, 61, 86, 1.0)),
                  onTap: (){
                    Get.to(() => EnRouteView());
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
