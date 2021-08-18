import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:ridethebee/app/callback/en_route_callback.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/messages/views/messages_view.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';
import 'package:ridethebee/app/modules/trip_completed/views/trip_completed_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_loading.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/en_route_controller.dart';

class EnRouteView extends GetView<EnRouteController> implements EnRouteCallback {

  EnRouteController _enRouteController = Get.put(EnRouteController());
  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            GetBuilder<EnRouteController>(
              id: "map_builder",
              init: EnRouteController(),
              builder: (value) => Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  initialCameraPosition: _enRouteController.kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _enRouteController.gmapController.complete(controller);
                    _enRouteController.googleMapController = controller;
                    _enRouteController.checkCurrentLocation(context);
                  },
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24,top: MyConstant.headerTopMargin,bottom: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 55,
                          height: 55,
                          color: Colors.transparent,
                          child: Center(
                            child: Image.asset("assets/ic_menu.png", height: 24, width: 24),
                          ),
                        ),
                        onTap: (){
                          Get.to(() => MenusView());
                        },
                      ),
                      Expanded(child: SizedBox(), flex: 1),
                      GetBuilder<EnRouteController>(
                          id: "pit_stop",
                          init: EnRouteController(),
                          builder: (value) => Text(!value.isPitStop ? "En Route" : "Pit Stop", style: TextStyle(
                          fontSize: 18,
                          fontFamily: "PoppinsBold",
                          color: Color.fromRGBO(63, 61, 86, 1.0)
                      ))),
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
                      )
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 135, left: 24, right: 24),
              width: double.maxFinite,
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/ic_yellow_from.png", width: 24, height: 24),
                          SizedBox(height: 8),
                          Image.asset("assets/ic_dots.png", width: 8, height: 25),
                          SizedBox(height: 8),
                          Image.asset("assets/ic_yellow_location.png", width: 24, height: 24),
                        ],
                      ),

                      SizedBox(width: 16),

                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From", style: TextStyle(
                            color: Color.fromRGBO(135, 141, 156, 1.0),
                            fontSize: 12,
                            fontFamily: "PoppinsRegular",
                          )),

                          Text(_enRouteController.tripModel.from, style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontSize: 14,
                            fontFamily: "PoppinsMedium",
                          )),
                          SizedBox(height: 24),
                          Text("To", style: TextStyle(
                            color: Color.fromRGBO(135, 141, 156, 1.0),
                            fontSize: 12,
                            fontFamily: "PoppinsRegular",
                          )),
                          Text(_enRouteController.tripModel.to, style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontSize: 14,
                            fontFamily: "PoppinsMedium",
                          )),
                        ],
                      ), flex: 1),

                      Container(
                        width: 1,
                        height: double.maxFinite,
                        color: Color.fromRGBO(234, 237, 241, 1.0),
                      ),

                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 16),
                              Text("ETA",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontSize: 14,
                                    fontFamily: "PoppinsRegular",
                                  ))
                            ],
                          ),


                          SizedBox(height: 8),

                          Row(
                            children: [
                              SizedBox(width: 16),
                              Expanded(child: GetBuilder<EnRouteController>(
                                  id: "pit_stop",
                                  init: EnRouteController(),
                                  builder: (value) => Text(!value.isPitStop ? "2 Hour 20 Min" : "Pit Stop 15 minutes",
                                      style: TextStyle(
                                        color: !value.isPitStop ? Color.fromRGBO(255, 205, 56, 1.0) : Color.fromRGBO(255, 140, 56, 1.0),
                                        fontSize: 17,
                                        height: 1.5,
                                        fontFamily: "PoppinsMedium",
                                      ))), flex: 1),
                            ],
                          )
                        ],
                      ), flex: 1),

                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),

            Positioned.fill(child: Align(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Expanded(child: SizedBox(), flex: 1),
                    Row(
                      children: [
                        SizedBox(width: 24),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          child: Container(
                            width: 65,
                            height: 65,
                            child: GestureDetector(
                              child: Center(
                                child: Image.asset("assets/ic_yellow_notif.png", height: 28, width: 28),
                              ),
                              onTap: (){
                                _enRouteController.setReminder(true);
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(width: 24),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          child: Container(
                            width: 65,
                            height: 65,
                            child: GestureDetector(
                              child: Center(
                                child: Image.asset("assets/ic_yellow_message.png", height: 28, width: 28),
                              ),
                              onTap: (){
                                Get.to(() => MessagesView());
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(width: 24),

                        Container(
                          width: 65,
                          height: 65,
                          child: Stack(
                            children: [
                              Image.asset("assets/ic_km.png", height: 65, width: 65),
                              Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("80", style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "PoppinsBold",
                                        fontSize: 14
                                    )),
                                    Text("km/h", style: TextStyle(
                                        color: Color.fromRGBO(195, 194, 204, 1.0),
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 10
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Expanded(child: SizedBox(),flex: 1),

                        GestureDetector(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child: Container(
                              width: 65,
                              height: 65,
                              child: Center(
                                child: Image.asset("assets/ic_current_location.png", height: 28, width: 28),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                            ),
                          ),
                          onTap: (){
                            _enRouteController.moveToCurrentLocation();
                          },
                        ),

                        SizedBox(width: 24),
                      ],
                    ),

                    SizedBox(height: 16),

                    GetBuilder<EnRouteController>(
                      id: "page_type",
                      init: EnRouteController(),
                      builder: (value) => GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 205, 56, 1.0),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.transparent
                                ),
                              ),

                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("12:32", style: TextStyle(
                                      color: Color.fromRGBO(50, 50, 51, 1.0),
                                      fontFamily: "PoppinsBold",
                                      fontSize: 20
                                  )),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("2 Hours", style: TextStyle(
                                          color: Color.fromRGBO(50, 50, 51, 1.0),
                                          fontFamily: "PoppinsMedium",
                                          fontSize: 16
                                      )),

                                      SizedBox(width: 16),

                                      Image.asset("assets/ic_black_circle.png"),

                                      SizedBox(width: 16),

                                      Text("120.6 km", style: TextStyle(
                                          color: Color.fromRGBO(50, 50, 51, 1.0),
                                          fontFamily: "PoppinsMedium",
                                          fontSize: 16
                                      ))
                                    ],
                                  )
                                ],
                              ), flex: 1),

                              GestureDetector(
                                child: Card(
                                  elevation: 1.5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(16))
                                  ),
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    child: Center(
                                      child: Image.asset("assets/ic_black_uparrow.png", height: 20, width: 20),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(16))
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  _enRouteController.setMenuShowed(true);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        if(value.pageType == 0){
                          value.setPitStop(true);
                        }
                        else{
                          Get.to(() => TripCompletedView(), arguments: {"trip_id" : _enRouteController.tripModel.id});
                        }
                      },
                    )
                    )
                  ],
                ),
              ),
            )),

              GetBuilder<EnRouteController>(
                id: "menu_show",
                init: EnRouteController(),
                builder: (value) => Visibility(child: Column(
                  children: [
                    Expanded(child: SizedBox(),flex: 1),
                    Row(
                      children: [
                        Expanded(child: SizedBox(),flex: 1),
                        Container(
                          width: 50,
                          height: 175,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: Image.asset("assets/ic_black_dropdown.png", width: 16, height: 16),
                                    onTap: (){
                                      _enRouteController.setMenuShowed(false);
                                    },
                                  ),
                                  SizedBox(height: 24),
                                  GestureDetector(
                                    child: Image.asset("assets/img_alert.png", width: 36, height: 36),
                                    onTap: (){
                                      _enRouteController.setEmergency(true);
                                      print("cuyy");
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    width: double.maxFinite,
                                    height: 1,
                                    color: Color.fromRGBO(235, 235, 235, 1.0),
                                  ),
                                  SizedBox(height: 16),
                                  GestureDetector(
                                    child: Image.asset("assets/img_share.png", width: 36, height: 36),
                                    onTap: (){
                                      MapsLauncher.launchQuery('1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');
                                      MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 22)
                      ],
                    ),
                    SizedBox(height: 16)
                  ],
                ), visible: value.isMenuShowed)),

            GetBuilder<EnRouteController>(
                id: "confirm",
                init: EnRouteController(),
                builder: (value) => Visibility(child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        width: double.maxFinite,
                        height: 365,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 1.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Expanded(child: PageView(
                                  controller: _enRouteController.pageController,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset("assets/img_begin_trip.png"),
                                        SizedBox(height: 16),
                                        Text("Are you ready to check in?", style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(63, 61, 86, 1.0),
                                            fontFamily: "PoppinsRegular"
                                        )),

                                        Padding(padding: EdgeInsets.only(top: 24,left: 24, right: 24, bottom: 16), child: GestureDetector(
                                          child: ColoredButton(height: 45, width: double.maxFinite, title: "Confirm",
                                              color: Color.fromRGBO(255, 205, 56, 1.0)),
                                          onTap: (){
                                            value.pageController.jumpToPage(1);
                                            //value.setConfirm(!value.isConfirmShowed);
                                          },
                                        )),

                                        GestureDetector(
                                          child: Text("Back", style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(135, 141, 156, 1.0),
                                              fontFamily: "PoppinsMedium"
                                          )),
                                          onTap: (){
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(child: Text("Would you like to set a reminder 15 minutes before arrival?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                                    fontFamily: "PoppinsRegular"
                                                )), flex: 1)
                                          ],
                                        ),

                                        SizedBox(height: 36),

                                        Image.asset("assets/img_reminder.png", height: 75,width: 75),

                                        SizedBox(height: 36),

                                        Container(
                                          padding: EdgeInsets.all(8),
                                          width: double.maxFinite,
                                          height: 65,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(244, 244, 244, 1.0),
                                              borderRadius: BorderRadius.all(Radius.circular(45))
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(child: GestureDetector(
                                                child: GetBuilder<EnRouteController>(
                                                  id: "reminder_color",
                                                  init: EnRouteController(),
                                                  builder: (value) => Container(
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: value.reminderType == 0 ? Color.fromRGBO(255, 205, 56, 1.0) : Color.fromRGBO(244, 244, 244, 1.0),
                                                        borderRadius: BorderRadius.all(Radius.circular(45))
                                                    ),
                                                    child: Center(
                                                      child: Text("YES", style: TextStyle(
                                                          color: value.reminderType == 0 ? Colors.white : Color.fromRGBO(135, 141, 156, 1.0),
                                                          fontSize: 16,
                                                          fontFamily: "PoppinsBold"
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                                onTap: (){
                                                   value.checkIn(this, 0);
                                                },
                                              )),
                                              Expanded(child: GestureDetector(
                                                child: GetBuilder<EnRouteController>(
                                                  id: "reminder_color",
                                                  init: EnRouteController(),
                                                  builder: (value) => Container(
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        color: value.reminderType == 1 ? Color.fromRGBO(135, 141, 156, 1.0) : Color.fromRGBO(244, 244, 244, 1.0),
                                                        borderRadius: BorderRadius.all(Radius.circular(45))
                                                    ),
                                                    child: Center(
                                                      child: Text("NO", style: TextStyle(
                                                          color: value.reminderType == 1 ? Colors.white : Color.fromRGBO(135, 141, 156, 1.0),
                                                          fontSize: 16,
                                                          fontFamily: "PoppinsBold"
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                                onTap: (){
                                                  value.checkIn(this, 1);
                                                },
                                              ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ), flex: 1),

                                SmoothPageIndicator(
                                  controller: _enRouteController.pageController,  // PageController
                                  count: 2,
                                  effect: WormEffect(
                                      dotWidth:  10.0,
                                      dotHeight:  10.0,
                                      spacing: 16,
                                      activeDotColor:  Color.fromRGBO(255, 205, 56, 1.0),
                                      dotColor: Color.fromRGBO(230, 230, 230, 1.0)
                                  ),  // your preferred effect
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ), visible: value.isConfirmShowed)),

            GetBuilder<EnRouteController>(
                id: "emergency_call",
                init: EnRouteController(),
                builder: (value) => Visibility(child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        width: double.maxFinite,
                        height: 390,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 1.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(child: Text("For Emergency Calls Only",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "PoppinsBold"
                                    )), flex: 1),
                                    GestureDetector(
                                      child: Image.asset("assets/ic_close_black.png", height: 24, width: 24),
                                      onTap: (){
                                        value.setEmergency(false);
                                      },
                                    )
                                  ],
                                ),

                                SizedBox(height: 24),

                                Image.asset("assets/img_emergency.png", height: 100,width: 100),

                                Padding(padding: EdgeInsets.only(top: 16,left: 24, right: 24), child: GestureDetector(
                                  child: ColoredButton(height: 45, width: double.maxFinite, title: "Call Driver",
                                      color: Color.fromRGBO(255, 205, 56, 1.0)),
                                  onTap: (){

                                  },
                                )),

                                GestureDetector(
                                  child: Text("or", style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(135, 141, 156, 1.0),
                                      fontFamily: "PoppinsRegular"
                                  )),
                                  onTap: (){

                                  },
                                ),

                                Padding(padding: EdgeInsets.only(top: 8,left: 24, right: 24, bottom: 16), child: GestureDetector(
                                  child: ColoredButton(height: 45, width: double.maxFinite, title: "Call Operator",
                                      color: Color.fromRGBO(135, 141, 156, 1.0)),
                                  onTap: (){

                                  },
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ), visible: value.isEmergencyShowed)),

            GetBuilder<EnRouteController>(
                id: "reminder",
                init: EnRouteController(),
                builder: (value) => Visibility(child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        width: double.maxFinite,
                        height: 335,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 1.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        width: 55,
                                        height: 55,
                                        color: Colors.transparent,
                                      ),
                                      onTap: (){

                                      },
                                    ),
                                    Expanded(child: Text("Arrival Reminder",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: "PoppinsBold"
                                        )), flex: 1),
                                    GestureDetector(
                                      child: Container(
                                        width: 55,
                                        height: 55,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Image.asset("assets/ic_close_black.png", height: 20, width: 20),
                                        ),
                                      ),
                                      onTap: (){
                                        value.setReminder(false);
                                      },
                                    )
                                  ],
                                ),

                                SizedBox(height: 36),

                                Image.asset("assets/img_reminder.png", height: 75,width: 75),

                                SizedBox(height: 36),
                                
                                GetBuilder<EnRouteController>(
                                  id: "reminder_arrival",
                                  init: EnRouteController(),
                                  builder: (value) => Container(
                                  padding: EdgeInsets.all(8),
                                  width: double.maxFinite,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(244, 244, 244, 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: GestureDetector(
                                        child: Container(
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          decoration: BoxDecoration(
                                              color: value.arrivalReminderType == 0 ? Color.fromRGBO(255, 205, 56, 1.0) :
                                              Color.fromRGBO(244, 244, 244, 1.0),
                                              borderRadius: BorderRadius.all(Radius.circular(45))
                                          ),
                                          child: Center(
                                            child: Text("ON", style: TextStyle(
                                                color: value.arrivalReminderType == 0 ? Colors.white : Color.fromRGBO(135, 141, 156, 1.0),
                                                fontSize: 16,
                                                fontFamily: "PoppinsBold"
                                            )),
                                          ),
                                        ),
                                        onTap: (){
                                          value.setReminderArrivalType(0);
                                        },
                                      )),
                                      Expanded(child: GestureDetector(
                                        child: Container(
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          decoration: BoxDecoration(
                                              color: value.arrivalReminderType == 1 ? Color.fromRGBO(135, 141, 156, 1.0) : Color.fromRGBO(244, 244, 244, 1.0),
                                              borderRadius: BorderRadius.all(Radius.circular(45))
                                          ),
                                          child: Center(
                                            child: Text("OFF", style: TextStyle(
                                                color: value.arrivalReminderType == 1 ? Colors.white : Color.fromRGBO(135, 141, 156, 1.0),
                                                fontSize: 16,
                                                fontFamily: "PoppinsBold"
                                            )),
                                          ),
                                        ),
                                        onTap: (){
                                          value.setReminderArrivalType(1);
                                        },
                                      ))
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ), visible: value.isReminderShowed)),
          ],
        ),
      ),
    );
  }

  @override
  void onEnRouteLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onEnRouteSuccess(String message, String status) {
    Get.back();
    _enRouteController.setConfirm(false);
  }

  @override
  void onEnRouteFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }
}
