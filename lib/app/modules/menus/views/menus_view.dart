import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/car_seats/views/car_seats_view.dart';
import 'package:ridethebee/app/modules/cashback_wallet/views/cashback_wallet_view.dart';
import 'package:ridethebee/app/modules/my_tickets/views/my_tickets_view.dart';
import 'package:ridethebee/app/modules/profile/views/profile_view.dart';
import 'package:ridethebee/app/modules/ticket_details/views/ticket_details_view.dart';

import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              child: Image.asset("assets/img_menu_background.png",
                  width: double.maxFinite,
                  height: double.maxFinite, fit: BoxFit.fill),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 45), child: Row(
                  children: [
                    Text("Menu", style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(63, 61, 86, 1.0),
                        fontFamily: "PoppinsMedium"
                    )),

                    Expanded(child: SizedBox(), flex: 1),

                    GestureDetector(child: Image.asset("assets/ic_close_black.png"),onTap: (){
                      Get.back();
                    })
                  ],
                )),

                SizedBox(height: 57),

                GestureDetector(
                  child: Row(
                    children: [
                      Image.asset("assets/img_default_profile.png", height: 55, width: 55),
                      SizedBox(width: 16),
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Elizabeth Tan", style: TextStyle(
                              fontSize: 18,
                              fontFamily: "PoppinsBold",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          )),
                          SizedBox(height: 4),
                          Text("elizabethtan@gmail.com", style: TextStyle(
                              fontSize: 12,
                              fontFamily: "PoppinsMedium",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          ))
                        ],
                      ), flex: 1),

                      Image.asset("assets/ic_circle_right.png", height: 24, width: 24)
                    ],
                  ),
                  onTap: (){
                    Get.to(ProfileView());
                  },
                ),

                SizedBox(height: 24),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/ic_search_trips.png", height: 24, width: 24),
                                SizedBox(width: 16),
                                Expanded(child: Text("Search Trips", style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "PoppinsMedium",
                                    color: Color.fromRGBO(63, 61, 86, 1.0)
                                )), flex: 1),
                                Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24)
                              ],
                            ),

                            SizedBox(height: 24),

                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: Color.fromRGBO(240, 240, 239, 1.0),
                            )
                          ],
                        ),

                        GestureDetector(
                          child: Column(
                            children: [
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Image.asset("assets/ic_wallet.png", height: 24, width: 24),
                                  SizedBox(width: 16),
                                  Expanded(child: Text("Cashback Wallet", style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PoppinsMedium",
                                      color: Color.fromRGBO(63, 61, 86, 1.0)
                                  )), flex: 1),
                                  Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24)
                                ],
                              ),

                              SizedBox(height: 16),
                            ],
                          ),
                          onTap: (){
                              Get.to(() => CashbackWalletView());
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("My Tickets", style: TextStyle(
                            fontSize: 18,
                            fontFamily: "PoppinsMedium",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        )),

                        SizedBox(height: 24),

                        GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  Image.asset("assets/ic_ongoing.png", height: 36, width: 36),
                                  SizedBox(width: 16),
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Ongoing", style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "PoppinsMedium",
                                          color: Color.fromRGBO(63, 61, 86, 1.0)
                                      )),
                                      SizedBox(height: 8),
                                      Text("Kuala Lumpur - Malaysia", style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "PoppinsRegular",
                                          color: Color.fromRGBO(135, 141, 156, 1.0)
                                      ))
                                    ],
                                  ), flex: 1),
                                  Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24)
                                ],
                              ),

                              SizedBox(height: 24),

                              Container(
                                width: double.maxFinite,
                                height: 1,
                                color: Color.fromRGBO(240, 240, 239, 1.0),
                              )
                            ],
                          ),
                          onTap: (){
                            Get.to(() => TicketDetailsView());
                          },
                        ),

                        GestureDetector(
                          child: Column(
                            children: [
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Image.asset("assets/ic_upcoming.png", height: 36, width: 36),
                                  SizedBox(width: 16),
                                  Expanded(child: Text("Upcoming", style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PoppinsMedium",
                                      color: Color.fromRGBO(63, 61, 86, 1.0)
                                  )), flex: 1),
                                  Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24)
                                ],
                              ),

                              SizedBox(height: 16),

                              Container(
                                width: double.maxFinite,
                                height: 1,
                                color: Color.fromRGBO(240, 240, 239, 1.0),
                              )
                            ],
                          ),
                          onTap: (){
                              Get.to(() => MyTicketsView());
                          },
                        ),


                        GestureDetector(
                          child: Column(
                            children: [
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Image.asset("assets/ic_completed.png", height: 36, width: 36),
                                  SizedBox(width: 16),
                                  Expanded(child: Text("Completed", style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PoppinsMedium",
                                      color: Color.fromRGBO(63, 61, 86, 1.0)
                                  )), flex: 1),
                                  Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24)
                                ],
                              ),

                              SizedBox(height: 16),
                            ],
                          ),
                          onTap: (){
                            Get.to(() => MyTicketsView());
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
