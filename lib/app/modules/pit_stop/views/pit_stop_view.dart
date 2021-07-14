import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';

import '../controllers/pit_stop_controller.dart';

class PitStopView extends GetView<PitStopController> {

  PitStopController _pitStopController = Get.put(PitStopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            GetBuilder<PitStopController>(
              id: "map_builder",
              init: PitStopController(),
              builder: (value) => Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  initialCameraPosition: _pitStopController.kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _pitStopController.gmapController.complete(controller);
                    _pitStopController.googleMapController = controller;
                    _pitStopController.checkCurrentLocation(context);
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
                  padding: EdgeInsets.only(left: 24, right: 24,top: 45,bottom: 24),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Image.asset("assets/ic_menu.png", width: 24, height: 24),
                        onTap: (){
                          Get.to(() => MenusView());
                        },
                      ),
                      Expanded(child: SizedBox(), flex: 1),
                      Text("Pit Stop", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(63, 61, 86, 1.0)
                      )),
                      Expanded(child: SizedBox(), flex: 1),
                      GestureDetector(
                        child: Image.asset("assets/ic_notification.png", width: 24, height: 24),
                        onTap: (){
                          Get.to(() => NotificationView());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),

            Visibility(child: Container(
              margin: EdgeInsets.only(top: 115, left: 24, right: 24),
              width: double.maxFinite,
              height: 145,
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
                              fontWeight: FontWeight.w700
                          )),
                          SizedBox(height: 8),
                          Text("Kuala Lumpur", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0),
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          )),
                          SizedBox(height: 24),
                          Text("To", style: TextStyle(
                              color: Color.fromRGBO(135, 141, 156, 1.0),
                              fontSize: 12,
                              fontWeight: FontWeight.w700
                          )),
                          SizedBox(height: 8),
                          Text("Penang", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0),
                              fontSize: 14,
                              fontWeight: FontWeight.w700
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
                                      fontWeight: FontWeight.w500
                                  ))
                            ],
                          ),


                          SizedBox(height: 8),

                          Row(
                            children: [
                              SizedBox(width: 16),
                              Expanded(child: Text("Pit Stop 15 minutes", style: TextStyle(
                                  color: Color.fromRGBO(255, 140, 56, 1.0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5
                              )), flex: 1),
                            ],
                          )
                        ],
                      ), flex: 1),

                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ), visible: true),

            Positioned.fill(child: Align(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Expanded(child: SizedBox(), flex: 1),
                    Row(
                      children: [
                        SizedBox(width: 24),

                        Visibility(child: Container(
                          width: 55,
                          height: 55,
                          child: Stack(
                            children: [
                              Image.asset("assets/ic_km.png", height: 100, width: 100),
                              Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("80", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    )),
                                    Text("km/h", style: TextStyle(
                                        color: Color.fromRGBO(195, 194, 204, 1.0),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ), visible: false),

                        Expanded(child: SizedBox(),flex: 1),

                        Container(
                          width: 55,
                          height: 55,
                          child: Image.asset("assets/ic_yellow_message.png", height: 16, width: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                        ),

                        SizedBox(width: 24),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                      width: double.maxFinite,
                      height: 230,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pit Stop", style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(135, 141, 156, 1.0),
                                  fontWeight: FontWeight.w500
                              )),
                              SizedBox(height: 6),
                              Text("R&R Sungai Buloh Southbound", style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(63, 61, 86, 1.0),
                                  fontWeight: FontWeight.bold
                              )),
                              Container(
                                margin: EdgeInsets.only(top: 24,bottom: 24),
                                height: 1,
                                width: double.maxFinite,
                                color: Color.fromRGBO(234, 237, 241, 1.0),
                              ),
                              Row(
                                children: [
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Duration", style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(135, 141, 156, 1.0),
                                          fontWeight: FontWeight.w500
                                      )),
                                      SizedBox(height: 6),
                                      Container(
                                        width: double.maxFinite,
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Expanded(child:  Text("15 minutes", style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                                    fontWeight: FontWeight.w500
                                                )),flex: 1),
                                                Image.asset("assets/ic_yellow_dropdown.png", height: 16, width: 16)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ), flex: 1),
                                  SizedBox(width: 24),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Timer", style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(135, 141, 156, 1.0),
                                          fontWeight: FontWeight.w500
                                      )),
                                      SizedBox(height: 6),
                                      Text("00:00:00", style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(255, 205, 56, 1.0),
                                          fontWeight: FontWeight.bold
                                      )),
                                    ],
                                  ),
                                  SizedBox(width: 24)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    GestureDetector(
                      child:  Container(
                        width: double.maxFinite,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 205, 56, 1.0)
                        ),
                        child: Center(
                          child: Text("Notify Passengers", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          )),
                        ),
                      ),
                      onTap: (){

                      },
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
