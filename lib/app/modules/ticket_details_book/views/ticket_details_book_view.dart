import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/ticket_details_book_controller.dart';

class TicketDetailsBookView extends GetView<TicketDetailsBookController> {

  TicketDetailsBookController _ticketDetailsBookController = Get.put(TicketDetailsBookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/home_background.png", width: double.maxFinite,
              height: double.maxFinite, fit: BoxFit.fill),

          GetBuilder<TicketDetailsBookController>(
            id: "detail_trip",
            init: TicketDetailsBookController(),
            builder: (detail_value) => Container(
            padding: EdgeInsets.only(bottom: 24,top: MyConstant.headerTopMargin),
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
                          child: Image.asset("assets/ic_black_left.png", height: 20, width: 20),
                        ),
                      ),
                      onTap: (){
                        Get.back();
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
                      ),
                      onTap: (){

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
                                    Text(detail_value.tripModel.bus_no,
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

                                        Text(detail_value.tripModel.depart_time, style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "PoppinsBold",
                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                        )),

                                        Text(detail_value.tripModel.date, style: TextStyle(
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

                                        Text(detail_value.tripModel.arrival_time, style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "PoppinsBold",
                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                        )),

                                        Text(detail_value.tripModel.date, style: TextStyle(
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
                                          Text(detail_value.tripModel.from, style: TextStyle(
                                              color: Color.fromRGBO(135, 141, 156, 1.0),
                                              fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(height: 8),
                                          Text(detail_value.tripModel.station_from, style: TextStyle(
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
                                          Text(detail_value.tripModel.to, style: TextStyle(
                                              color: Color.fromRGBO(135, 141, 156, 1.0),
                                              fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(height: 8),
                                          Text(detail_value.tripModel.station_to, style: TextStyle(
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
                                        Text(detail_value.tripModel.client, style: TextStyle(
                                            color: Color.fromRGBO(63, 61, 86, 1.0),
                                            fontSize: 16,
                                            fontFamily: "PoppinsMedium"
                                        ))
                                      ],
                                    ), flex: 1),

                                    CircleAvatar(
                                      backgroundColor: Color.fromRGBO(255, 205, 56, 1.0),
                                      radius: 22.0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 20.0,
                                        backgroundImage: NetworkImage(detail_value.tripModel.client_img),
                                      ),
                                    ),
                                    SizedBox(width: 16)
                                  ],
                                )
                              ],
                            ),
                          ), flex: 1),

                          SizedBox(height: 75),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 24),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ticket x 1", style: TextStyle(
                                      color: Color.fromRGBO(135, 141, 156, 1.0),
                                      fontSize: 14,
                                      fontFamily: "PoppinsRegular"
                                  )),

                                  SizedBox(height: 8),

                                  Text("Total", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0),
                                      fontSize: 18,
                                      fontFamily: "PoppinsBold"
                                  ))
                                ],
                              ), flex: 1),

                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("RM${detail_value.tripModel.price}", style: TextStyle(
                                      color: Color.fromRGBO(135, 141, 156, 1.0),
                                      fontSize: 14,
                                      fontFamily: "PoppinsRegular"
                                  )),

                                  SizedBox(height: 8),

                                  Text("RM${detail_value.tripModel.price}", style: TextStyle(
                                      color: Color.fromRGBO(22, 212, 98, 1.0),
                                      fontSize: 20,
                                      fontFamily: "PoppinsBold"
                                  ))
                                ],
                              ), flex: 1),
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

                                  SizedBox(height: 16),

                                  SizedBox(height: 16),

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
                          SizedBox(height: 115)
                        ],
                      ),
                    )
                  ],
                ), flex: 1),

                Padding(padding: EdgeInsets.only(bottom: 0, left: 24, right: 24), child: GestureDetector(
                  child: ColoredButton(height: 55, width: double.maxFinite,
                      title: "Book Now",
                      color: Color.fromRGBO(63, 61, 86, 1.0)),
                  onTap: (){
                    _ticketDetailsBookController.goToSeatBook();
                  },
                )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
