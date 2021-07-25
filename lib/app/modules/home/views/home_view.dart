import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';
import 'package:ridethebee/app/modules/ticket_details_book/views/ticket_details_book_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/img_home_background.png", width: double.maxFinite,
              height: double.maxFinite, fit: BoxFit.cover),
          Column(
            children: [
              SizedBox(height: 36),
              Row(
                children: [
                  SizedBox(width: 24),

                  GestureDetector(
                    child: Image.asset("assets/ic_menu.png", height: 28, width: 28),
                    onTap: (){
                      Get.to(MenusView());
                    },
                  ),

                  Expanded(child: SizedBox(),flex: 1),

                  Text("Search Trips", style: TextStyle(
                      color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 18,
                      fontFamily: "PoppinsBold"
                  )),

                  Expanded(child: SizedBox(),flex: 1),

                  GestureDetector(
                    child: Image.asset("assets/ic_notification.png", height: 28, width: 28),
                    onTap: (){
                      Get.to(NotificationView());
                    },
                  ),

                  SizedBox(width: 24),
                ],
              ),

              SizedBox(height: 24),

              Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24,top: 16,bottom: 16),
                      child: Row(
                        children: [
                          Expanded(child: Text("Select Date", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0),
                              fontFamily: "PoppinsMedium"
                          )), flex: 1),
                          SizedBox(width: 16),
                          Image.asset("assets/ic_calendar.png", height: 16, width: 16)
                        ],
                      ),
                    ),
                  ), flex: 1),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24,top: 16,bottom: 16),
                      child: Row(
                        children: [
                          Text("No. Of Pax", style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                              fontFamily: "PoppinsMedium"
                          )),
                          SizedBox(width: 16),
                          Image.asset("assets/ic_yellow_dropdown.png", height: 16, width: 16)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),

              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 24, right: 24, top: 16),
                 child: Card(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(8))
                   ),
                   child: Padding(
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
                             Text("From", style: TextStyle(
                               color: Color.fromRGBO(135, 141, 156, 1.0),
                               fontSize: 14,
                               fontFamily: "PoppinsMedium"
                             )),
                             SizedBox(height: 8),
                             Text("Kuala Lumpur", style: TextStyle(
                                 color: Color.fromRGBO(63, 61, 86, 1.0),
                                 fontSize: 16,
                                 fontFamily: "PoppinsMedium"
                             )),
                             SizedBox(height: 24),
                             Container(
                               width: double.maxFinite,
                               height: 1,
                               color: Color.fromRGBO(236, 239, 241, 1.0),
                             ),
                             SizedBox(height: 24),
                             Text("To", style: TextStyle(
                                 color: Color.fromRGBO(135, 141, 156, 1.0),
                                 fontSize: 14,
                                 fontFamily: "PoppinsMedium"
                             )),
                             SizedBox(height: 8),
                             Text("Penang", style: TextStyle(
                                 color: Color.fromRGBO(63, 61, 86, 1.0),
                                 fontSize: 16,
                                 fontFamily: "PoppinsMedium"
                             )),
                           ],
                         ), flex: 1),

                         SizedBox(width: 16),

                         Container(
                           padding: EdgeInsets.all(16),
                           child: Image.asset("assets/ic_filter.png", height: 16, width: 16),
                           decoration: BoxDecoration(
                             color: Color.fromRGBO(240, 242, 247, 1.0),
                             borderRadius: BorderRadius.all(Radius.circular(8))
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
              ),
            ],
          ),
          
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: DraggableScrollableSheet(
                initialChildSize: 0.52,
                minChildSize: 0.52,
                maxChildSize: 1.0,
                expand: false,
                builder: (context, pageController){
                  return Container(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 24, right: 24,bottom: 16),
                              width: double.maxFinite,
                              child: Center(
                                child: Container(
                                  width: 55,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                              ),
                              child: Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 24), child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Depart Time", style: TextStyle(
                                              color: Color.fromRGBO(63, 61, 86, 1.0),
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(width: 14),
                                          Image.asset("assets/ic_triangle_arrow.png", height: 14, width: 14)
                                        ],
                                      ),

                                      SizedBox(width: 16),

                                      Row(
                                        children: [
                                          Text("Ticket Price", style: TextStyle(
                                              color: Color.fromRGBO(63, 61, 86, 1.0),
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          SizedBox(width: 14),
                                          Image.asset("assets/ic_triangle_arrow.png", height: 14, width: 14)
                                        ],
                                      )
                                    ],
                                  )),

                                  SizedBox(height: 24),

                                  Expanded(child: ListView.builder(
                                    itemBuilder: (context,index){
                                    return GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(top: index == 0 ? 0 : 16,left: 24, right: 24),
                                        height: 275,
                                        color: Colors.white,
                                        width: double.maxFinite,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(child: Align(
                                              child: Container(
                                                width: double.maxFinite,
                                                margin: EdgeInsets.only(top: 8, bottom: 8),
                                                padding: EdgeInsets.only(left: 24, right: 24, top: 16,bottom: 16),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Color.fromRGBO(63, 61, 86, 0.5)
                                                    )
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Text("From", style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: "PoppinsMedium",
                                                              color: Color.fromRGBO(63, 61, 86, 1.0)
                                                          )),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                                              border: Border.all(
                                                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                                              )
                                                          ),
                                                          padding: EdgeInsets.only(left: 12, right: 12, top: 4,bottom: 4),
                                                        ),

                                                        Expanded(child: Image.asset("assets/ic_track.png"), flex: 1),

                                                        Container(
                                                          child: Text("To", style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: "PoppinsMedium",
                                                              color: Color.fromRGBO(63, 61, 86, 1.0)
                                                          )),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                                              border: Border.all(
                                                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                                              )
                                                          ),
                                                          padding: EdgeInsets.only(left: 12, right: 12, top: 4,bottom: 4),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(height: 16),

                                                    Row(
                                                      children: [
                                                        Expanded(child: Column(
                                                          children: [
                                                            Text("Sungai Nibong Bus Terminal", style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily: "PoppinsMedium",
                                                                color: Color.fromRGBO(63, 61, 86, 1.0)
                                                            )),
                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                        ), flex: 2),

                                                        Expanded(child: SizedBox(), flex: 1),

                                                        Expanded(child: Column(
                                                          children: [
                                                            Text("Sungai Nibong Bus Terminal",
                                                                textAlign: TextAlign.end,
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontFamily: "PoppinsMedium",
                                                                    color: Color.fromRGBO(63, 61, 86, 1.0)
                                                                )),
                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                        ), flex: 2),
                                                      ],
                                                    ),

                                                    SizedBox(height: 30),

                                                    Row(
                                                      children: [
                                                        Text("10:15 AM", style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: "PoppinsMedium",
                                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                                        )),

                                                        Expanded(child: SizedBox(), flex: 1),

                                                        Text("1:05 PM", style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: "PoppinsMedium",
                                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                                        )),
                                                      ],
                                                    ),

                                                    SizedBox(height: 16),

                                                    Row(
                                                      children: [
                                                        Image.asset("assets/img_ridethebees.png",height: 45, width: 45),
                                                        SizedBox(width: 16),
                                                        Container(
                                                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Image.asset("assets/ic_bus.png", width: 12, height: 12, fit: BoxFit.cover),
                                                              SizedBox(width: 4),
                                                              Text("SAB 4124",
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(35, 35, 35, 1.0),
                                                                      fontSize: 14,
                                                                      fontFamily: "PoppinsMedium"
                                                                  ))
                                                            ],
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Color.fromRGBO(255, 205, 56, 1.0),
                                                              borderRadius: BorderRadius.all(Radius.circular(25))
                                                          ),
                                                        ),
                                                        Expanded(child: SizedBox(), flex: 1),
                                                        Text("RM35.00",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(22, 212, 98, 1.0),
                                                                fontSize: 18,
                                                                fontFamily: "PoppinsBold"
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                            )),

                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(child: SizedBox(), flex: 1),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 35,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                                                                  bottomRight: Radius.circular(25)),
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1),
                                                                  right: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1),
                                                                  top: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1),
                                                                  left: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1)
                                                              )
                                                          ),
                                                        ),

                                                        Container(
                                                          height: 8,
                                                          width: 35,
                                                          color: Colors.white
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(child: SizedBox(), flex: 1)
                                                  ],
                                                ),

                                                Expanded(child: SizedBox(), flex: 1),

                                                Row(
                                                  children: [
                                                    Expanded(child: SizedBox(), flex: 1),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height: 19,
                                                          width: 35,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(25),
                                                                  topRight: Radius.circular(25)),
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1),
                                                                  right: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1),
                                                                  top: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1),
                                                                  left: BorderSide(
                                                                      color: Color.fromRGBO(63, 61, 86, 0.5),
                                                                      width: 1)
                                                              )
                                                          ),
                                                          margin: EdgeInsets.only(bottom: 1),
                                                        ),

                                                        Positioned.fill(child: Align(
                                                          child: Container(
                                                            height: 8,
                                                            width: 35,
                                                            color: Colors.white,
                                                          ),
                                                          alignment: Alignment.bottomCenter,
                                                        ))
                                                      ],
                                                    ),
                                                    Expanded(child: SizedBox(), flex: 1)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Get.to(() => TicketDetailsBookView());
                                      },
                                    );
                                  },
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: 5,
                                    primary: false,
                                    controller: pageController,
                                  ), flex: 1)
                                ],
                              ),
                            ), flex: 1)
                          ],
                        ),

                        Padding(padding: EdgeInsets.only(top: 0, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Image.asset("assets/img_filter.png",width: 55,
                                    height: 55),
                                onTap: (){

                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}



