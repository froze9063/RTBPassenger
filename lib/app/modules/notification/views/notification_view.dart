import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 24, right: 10, top: MyConstant.headerTopMargin),
                child: Row(
              children: [
                Text("Notifications", style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(63, 61, 86, 1.0),
                    fontFamily: "PoppinsMedium"
                )),

                Expanded(child: SizedBox(), flex: 1),

                GestureDetector(child: Container(
                  width: 55,
                  height: 55,
                  color: Colors.white,
                  child: Center(
                    child: Image.asset("assets/ic_close_black.png", height: 20,
                        width: 20),
                  ),
                ),onTap: (){
                  Get.back();
                })
              ],
            )),

            Expanded(child: GetBuilder<NotificationController>(
              id: "notification",
              init: NotificationController(),
              builder: (value) => MediaQuery.removePadding(context: context, child: ListView.builder(itemBuilder: (context,index){
                Map notifMap = value.notifList[index];
                return GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(top: index == 0 ? 24 : 0, bottom: index == 7 ? 100 : 0),
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(child: Padding(padding: EdgeInsets.only(left: 24, top: index == 2 ? 36 : 0),
                              child: Text(index == 0 ? "Today" : "This Week",style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(58, 58, 58, 1.0),
                                  fontFamily: "PoppinsMedium"
                              ))),
                            visible: index == 0 || index == 2 ? true : false,
                          ),

                          Visibility(child: Container(
                              margin: EdgeInsets.only(top: 16),
                              width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                              237, 241, 1.0)), visible: index == 2),

                          Container(
                            width: double.maxFinite,
                            color: notifMap["color"],
                            child: Padding(
                              padding: EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Bus Arrived", style: TextStyle(
                                          color: Color.fromRGBO(58, 58, 58, 1.0),
                                          fontSize: 16,
                                          fontFamily: "PoppinsBold"
                                      )),
                                      SizedBox(height: 4),
                                      Text("Your bus  SAB 4124, is ready for Departure, in 10 minutes.", style: TextStyle(
                                          height: 1.5,
                                          fontFamily: "PoppinsRegular"
                                      )),
                                      SizedBox(height: 4),
                                      Text("2 Hours Ago", style: TextStyle(
                                          color: Color.fromRGBO(188, 196, 204, 1.0),
                                          fontSize: 12,
                                          fontFamily: "PoppinsMedium"
                                      )),
                                    ],
                                  ),flex: 1),
                                ],
                              ),
                            ),
                          ),
                          Container(width: double.maxFinite, height: 1, color: Color.fromRGBO(243,
                              237, 241, 1.0)),
                        ],
                      )
                  ),
                  onTap: (){
                    value.changeNotifColor(Colors.white,index);
                  },
                  onTapCancel: (){
                    value.changeNotifColor(Colors.white,index);
                  },
                  onTapUp: (text){
                    value.changeNotifColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5),index);
                  },
                  onTapDown: (text){
                    value.changeNotifColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5),index);
                  },
                );
              },
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: value.notifList.length,
                primary: false,
              )),
            ), flex: 1)
          ],
        ),
      ),
    );
  }
}
