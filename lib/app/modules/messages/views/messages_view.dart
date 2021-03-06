import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 315,
              child: Column(
                children: [
                  Expanded(child: Container(
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          child: Image.asset("assets/img_menu_background.png",
                              width: double.maxFinite,
                              height: double.maxFinite,
                              fit: BoxFit.fill),
                        ),

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
                                  ),
                                  onTap: (){

                                  },
                                ),
                                Expanded(child: Text(
                                    "Message Driver",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                        fontFamily: "PoppinsBold"
                                    )), flex: 1),
                                GestureDetector(
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Image.asset("assets/ic_close_black.png",height: 24, width: 20),
                                    ),
                                  ),
                                  onTap: (){
                                    Get.back();
                                  },
                                ),
                                SizedBox(width: 10),
                              ],
                            ),

                            Image.asset("assets/img_driver_home.png", width: 100, height: 100),

                            SizedBox(height: 16),

                            Text("John Travis Scott Travolta", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 20,
                                fontFamily: "PoppinsBold"
                            )),

                            SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/ic_black_star.png"),
                                SizedBox(width: 8),
                                Text("4.8 Driver Rating", style: TextStyle(
                                    color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 14,
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                  ), flex: 1),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
              ),
            ),

            Expanded(child: ListView.builder(itemBuilder: (context,index){
              return index == 0 ? Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                padding: EdgeInsets.all(16),
                child: Text("You are now messaging the driver. The driver will only "
                    "be notified when he???s not driving. Please do not disturb the "
                    "driver unless needed.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 13,
                    fontFamily: "PoppinsBold",
                    height: 1.5
                )),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 247, 222, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ) : index %2 == 0 ? Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                child: Row(
                  children: [
                    Image.asset("assets/ic_new_travis.png",height: 45,width: 45,
                        fit: BoxFit.cover),
                    SizedBox(width: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text("Hello ?", style: TextStyle(
                          color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 13,
                          fontFamily: "PoppinsRegular",
                      )),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 239, 250, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    )
                  ],
                ),
              ) : Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text("I???ll be right there, please wait for me!", style: TextStyle(
                              color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 13,
                              fontFamily: "PoppinsRegular",
                          )),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 205, 56, 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),

                        SizedBox(height: 4),

                        Text("Read", style: TextStyle(
                            color: Color.fromRGBO(195, 194, 204, 1.0), fontSize: 14,
                            fontFamily: "PoppinsRegular",
                        ))
                      ],
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              );
            },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 6,
              primary: false,
            ), flex: 1),

            Container(
              width: double.maxFinite,
              height: 1,
              color: Color.fromRGBO(235, 235, 235, 1.0),
            ),

            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              width: double.maxFinite,
              height: 85,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  height: 55,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(child: TextField(
                          style: TextStyle(
                            fontFamily: "PoppinsMedium",
                            fontSize: 15,
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                          ),
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Type a message',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(135, 141, 156, 1.0),
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 15
                              )
                          ),
                        ), flex: 1),

                        Container(
                          margin: EdgeInsets.all(8),
                          width: 45,
                          height: 45,
                          child: Image.asset("assets/ic_send.png", height: 12, width: 12),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 205, 56, 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

