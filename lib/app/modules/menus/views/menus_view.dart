import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/car_seats/views/car_seats_view.dart';

import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 135,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(220, 220, 220, 1.0)
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(25))
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 24),

                  GestureDetector(
                    child: Image.asset("assets/ic_close_black.png", height: 36, width: 36),
                    onTap: (){
                      Get.back();
                    },
                  ),

                  Expanded(child: SizedBox(),flex: 1),

                  Text("Menu", style: TextStyle(
                      color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                      fontWeight: FontWeight.bold
                  )),

                  Expanded(child: SizedBox(),flex: 1),

                  Image.asset("assets/ic_notification.png", height: 36, width: 36),

                  SizedBox(width: 24),
                ],
              ),
            ),
          ),
          
          Expanded(child: Column(
            children: [
              SizedBox(height: 36),

              Column(
                children: [
                  Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                      237, 241, 1.0)),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    width: double.maxFinite,
                    height: 90,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset("assets/ic_home.png", height: 36, width: 36),
                          SizedBox(width: 16),
                          Text("Home", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              GestureDetector(
                child: Column(
                  children: [
                    Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                        237, 241, 1.0)),
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      width: double.maxFinite,
                      height: 90,
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset("assets/ic_book_trip.png", height: 36, width: 36),
                            SizedBox(width: 16),
                            Text("Book A Trip", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                                fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                onTap: (){
                  Get.to(CarSeatsView());
                },
              ),

              Column(
                children: [
                  Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                      237, 241, 1.0)),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    width: double.maxFinite,
                    height: 90,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset("assets/ic_ticket_details.png", height: 36, width: 36),
                          SizedBox(width: 16),
                          Text("Ticket Details", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Column(
                children: [
                  Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                      237, 241, 1.0)),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    width: double.maxFinite,
                    height: 90,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset("assets/ic_my_wallet.png", height: 36, width: 36),
                          SizedBox(width: 16),
                          Text("My Wallet", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Column(
                children: [
                  Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                      237, 241, 1.0)),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    width: double.maxFinite,
                    height: 90,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset("assets/ic_settings.png", height: 36, width: 36),
                          SizedBox(width: 16),
                          Text("Settings", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                  237, 241, 1.0))
            ],
          ), flex: 1)
        ],
      ),
    );
  }
}
