import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';
import 'package:ridethebee/app/modules/ticket_details_book/views/ticket_details_book_view.dart';
import 'package:shimmer/shimmer.dart';

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
                        child: Image.asset("assets/ic_menu.png", height: 28, width: 28),
                      ),
                    ),
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
                    child: Container(
                      width: 55,
                      height: 55,
                      color: Colors.transparent,
                      child: Center(
                        child: Image.asset("assets/ic_notification.png", height: 28, width: 28),
                      ),
                    ),
                    onTap: (){
                      Get.to(NotificationView());
                    },
                  ),

                  SizedBox(width: 10),
                ],
              ),

              SizedBox(height: 8),

              Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(child: GestureDetector(
                    child: GetBuilder<HomeController>(
                      id: "select_date",
                      init: HomeController(),
                      builder: (value) => Container(
                        color: Colors.transparent,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 24,top: 16,bottom: 16),
                            child: Row(
                              children: [
                                Expanded(child: Text(value.selectedDate, style: TextStyle(
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                )), flex: 1),
                                SizedBox(width: 16),
                                Image.asset("assets/ic_calendar.png", height: 16, width: 16)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                        homeController.showCalendar(context);
                    },
                  ), flex: 1),

                  GetBuilder<HomeController>(
                    id: "pax",
                    init: HomeController(),
                    builder: (value) => GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      width: 166,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24, right: 24,top: 16,bottom: 16),
                          child: Row(
                            children: [
                              Text(value.selectedPax, style: TextStyle(
                                  color: Color.fromRGBO(63, 61, 86, 1.0),
                                  fontFamily: "PoppinsMedium"
                              )),
                              SizedBox(width: 16),
                              Image.asset("assets/ic_yellow_dropdown.png", height: 16, width: 16)
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      value.setPaxListShow(true);
                    },
                  )),
                  SizedBox(width: 24),
                ],
              ),

              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 24, right: 24, top: 8),
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

                         GetBuilder<HomeController>(
                           id: "switch_location",
                           init: HomeController(),
                           builder: (value) => Expanded(child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("From", style: TextStyle(
                                 color: Color.fromRGBO(135, 141, 156, 1.0),
                                 fontSize: 14,
                                 fontFamily: "PoppinsMedium"
                             )),
                             SizedBox(height: 8),
                             TextField(
                                 controller: homeController.fromController,
                                 onChanged: (text){
                                   homeController.searchTrips();
                                 },
                                 decoration: InputDecoration.collapsed(hintText:
                                 "From"
                                 ),
                                 style: TextStyle(
                                     color: Color.fromRGBO(63, 61, 86, 1.0),
                                     fontSize: 16,
                                     fontFamily: "PoppinsMedium"
                                 )
                             ),
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
                             TextField(
                                 controller: homeController.toController,
                                 onChanged: (text){
                                   homeController.searchTrips();
                                 },
                                 decoration: InputDecoration.collapsed(hintText:
                                 "To"
                                 ),
                                 style: TextStyle(
                                     color: Color.fromRGBO(63, 61, 86, 1.0),
                                     fontSize: 16,
                                     fontFamily: "PoppinsMedium"
                                 )
                             ),
                           ],
                         ), flex: 1)),

                         SizedBox(width: 16),

                         GestureDetector(
                           child: Container(
                             padding: EdgeInsets.all(16),
                             child: Image.asset("assets/ic_filter.png", height: 16, width: 16),
                             decoration: BoxDecoration(
                                 color: Color.fromRGBO(240, 242, 247, 1.0),
                                 borderRadius: BorderRadius.all(Radius.circular(8))
                             ),
                           ),
                           onTap: (){
                             homeController.switchLocation();
                           },
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
                initialChildSize: 0.55,
                minChildSize: 0.55,
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
                                      GetBuilder<HomeController>(
                                        id: "depart_time",
                                        init: HomeController(),
                                        builder: (value) =>GestureDetector(
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              Text("Depart Time", style: TextStyle(
                                                  color: Color.fromRGBO(63, 61, 86, 1.0),
                                                  fontFamily: "PoppinsMedium"
                                              )),
                                              SizedBox(width: 14),
                                              Image.asset(value.departTimeDown ? "assets/ic_triangle_arrow.png" : "assets/ic_triangleup_arrow.png", height: 14, width: 14)
                                            ],
                                          ),
                                        ),
                                        onTap: (){
                                            value.setSortPriceTime(!value.departTimeDown, 0);
                                        },
                                      )),

                                      SizedBox(width: 16),

                                      GetBuilder<HomeController>(
                                          id: "ticket_price",
                                          init: HomeController(),
                                          builder: (value) =>GestureDetector(
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(
                                                children: [
                                                  Text("Ticket Price", style: TextStyle(
                                                      color: Color.fromRGBO(63, 61, 86, 1.0),
                                                      fontFamily: "PoppinsMedium"
                                                  )),
                                                  SizedBox(width: 14),
                                                  Image.asset(value.ticketPriceDown ? "assets/ic_triangle_arrow.png" : "assets/ic_triangleup_arrow.png", height: 14, width: 14)
                                                ],
                                              ),
                                            ),
                                            onTap: (){
                                              value.setSortPriceTime(!value.ticketPriceDown, 1);
                                            },
                                          )),
                                    ],
                                  )),

                                  SizedBox(height: 24),

                                  Expanded(child: GetBuilder<HomeController>(
                                    id: "filter",
                                    init: HomeController(),
                                    builder: (value) => value.isLoading ? loadingView() : value.tripModelList.length > 0 ? ListView.builder(
                                      itemBuilder: (context,index){
                                        TripModel tripModel = value.tripModelList[index];
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
                                                            width: 2,
                                                            color: Color.fromRGBO(220, 220, 224, 0.5)
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color.fromRGBO(220, 220, 224, 0.5),
                                                            blurRadius: 0.5,
                                                            spreadRadius: 0.5,
                                                            offset: Offset(0.5, 0.5), // shadow direction: bottom right
                                                          )
                                                        ]
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
                                                                Text(tripModel.from,
                                                                    maxLines: 2,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
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
                                                                Text(tripModel.to,
                                                                    textAlign: TextAlign.end,
                                                                    maxLines: 2,
                                                                    overflow: TextOverflow.ellipsis,
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
                                                            Text(tripModel.depart_time.toUpperCase(), style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily: "PoppinsMedium",
                                                                color: Color.fromRGBO(63, 61, 86, 1.0)
                                                            )),

                                                            Expanded(child: SizedBox(), flex: 1),

                                                            Text(tripModel.arrival_time.toUpperCase(), style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily: "PoppinsMedium",
                                                                color: Color.fromRGBO(63, 61, 86, 1.0)
                                                            )),
                                                          ],
                                                        ),

                                                        SizedBox(height: 16),

                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor: Color.fromRGBO(255, 205, 56, 1.0),
                                                              radius: 22.0,
                                                              child: CircleAvatar(
                                                                backgroundColor: Colors.transparent,
                                                                radius: 20.0,
                                                                backgroundImage: NetworkImage(tripModel.client_img),
                                                              ),
                                                            ),

                                                            SizedBox(width: 16),
                                                            Container(
                                                              padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Image.asset("assets/ic_bus.png", width: 12, height: 12, fit: BoxFit.cover),
                                                                  SizedBox(width: 4),
                                                                  Text(tripModel.bus_no,
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
                                                            Text("RM${tripModel.price}",
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
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2),
                                                                      right: BorderSide(
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2),
                                                                      top: BorderSide(
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2),
                                                                      left: BorderSide(
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2)
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                      blurRadius: 0.5,
                                                                      spreadRadius: 0.5,
                                                                      offset: Offset(0.5, 0.5), // shadow direction: bottom right
                                                                    )
                                                                  ]
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
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2),
                                                                      right: BorderSide(
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2),
                                                                      top: BorderSide(
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2),
                                                                      left: BorderSide(
                                                                          color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                          width: 2)
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(220, 220, 224, 0.5),
                                                                      blurRadius: 0.5,
                                                                      spreadRadius: 0.5,
                                                                      offset: Offset(-0.5, -0.5), // shadow direction: bottom right
                                                                    )
                                                                  ]
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
                                            Get.to(() => TicketDetailsBookView(), arguments: {"trip_id" : tripModel.id});
                                          },
                                        );
                                      },
                                      physics: ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemCount: value.tripModelList.length,
                                      primary: false,
                                      controller: pageController,
                                    ) : Column(
                                      children: [
                                        Text("Oh snap!",
                                            style: TextStyle(
                                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                                fontSize: 30,
                                                fontFamily: "PoppinsBold"
                                            )),

                                        SizedBox(height: 8),

                                        Text("No trips near you try to search\nwith a different location",
                                            style: TextStyle(
                                                color: Color.fromRGBO(58, 58, 58, 1.0),
                                                fontSize: 16,
                                                fontFamily: "PoppinsRegular"
                                            ), textAlign: TextAlign.center)
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    ),
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
                                   homeController.goToFilterPage();
                                },
                              )
                            ],
                          ),
                        ),

                        GetBuilder<HomeController>(
                          id: "filter",
                          init: HomeController(),
                          builder: (value) => Visibility(child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            CircleAvatar(
                              radius: 10.0,
                              backgroundColor: Colors.red,
                              child: Text("${value.totalFilter}", style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontFamily: "PoppinsRegular",
                              )),
                            ),
                            SizedBox(width: 24)
                          ],
                        ), visible: value.companyid.length > 0 ||
                              value.pickupPoints.length > 0 ||
                              value.dropoffPoints.length > 0))
                      ],
                    ),
                  );
                }),
          ),

          GetBuilder<HomeController>(
              id: "paxlist",
              init: HomeController(),
              builder: (value) => Visibility(child: GestureDetector(
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 157),
                      Row(
                        children: [
                          Expanded(child: SizedBox(), flex: 1),
                          Container(
                            margin: EdgeInsets.only(right: 27),
                            width: 159,
                            height: 105,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.2,
                                    color: Colors.grey.withOpacity(0.5)
                                )
                            ),
                            child: MediaQuery.removePadding(
                                context: context,
                                child: ListView.builder(
                                  itemBuilder: (context,index){
                                    return GestureDetector(
                                      child: Container(
                                        color: Colors.white,
                                        width: double.maxFinite,
                                        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(homeController.paxList[index], style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(135, 141, 156, 1.0),
                                              fontFamily: "PoppinsRegular",
                                            )),

                                            SizedBox(height: 8),

                                            Container(
                                              height: 1,
                                              width: double.maxFinite,
                                              color: Color.fromRGBO(234, 237, 241, 1.0),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        homeController.setPax(homeController.paxList[index]);
                                      },
                                    );
                                  },
                                  shrinkWrap: true,
                                  primary: false,
                                  padding: EdgeInsets.zero,
                                  itemCount: homeController.paxList.length,
                                )),
                          )
                        ],
                      ),

                      SizedBox(height: 8)
                    ],
                  ),
                ),
                onTap: (){
                  value.setPaxListShow(false);
                },
              ), visible: value.isPaxListShowed))
        ],
      ),
    );
  }

  Widget loadingView(){
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Shimmer.fromColors(
        baseColor: Color.fromRGBO(236, 239, 241, 1.0),
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),

              SizedBox(height: 24),

              Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



