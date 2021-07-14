import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 45), child: Row(
              children: [
                Text("Notifications", style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(63, 61, 86, 1.0),
                    fontWeight: FontWeight.bold
                )),

                Expanded(child: SizedBox(), flex: 1),

                GestureDetector(child: Image.asset("assets/ic_close_black.png"),onTap: (){
                  Get.back();
                })
              ],
            )),

            Expanded(child: MediaQuery.removePadding(context: context, child: ListView.builder(itemBuilder: (context,index){
              return Container(
                  margin: EdgeInsets.only(top: index == 0 ? 36 : 16, bottom: index == 7 ? 100 : 0),
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(child: Padding(padding: EdgeInsets.only(left: 24),
                          child: Text(index == 0 ? "Today" : "This Week",style: TextStyle(
                              color: Color.fromRGBO(58, 58, 58, 1.0),
                              fontWeight: FontWeight.w700
                          ))),
                        visible: index == 0 || index == 2 ? true : false,
                      ),
                      Visibility(child: SizedBox(height: 8), visible: index == 0 || index == 2),
                      Container(
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24,right: 24,top: 16,bottom: 16),
                          child: Row(
                            children: [
                              Image.asset("assets/img_notif_example.png",height: 55,width: 55),
                              SizedBox(width: 16),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bus Arrived", style: TextStyle(
                                      color: Color.fromRGBO(58, 58, 58, 1.0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  )),
                                  SizedBox(height: 4),
                                  Text("Your bus  SAB 4124, is ready for Departure, in 10 minutes.", style: TextStyle(
                                      height: 1.5
                                  )),
                                  SizedBox(height: 4),
                                  Text("2 Hours Ago", style: TextStyle(
                                      color: Color.fromRGBO(188, 196, 204, 1.0),
                                      fontSize: 12
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
              );
            },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 8,
              primary: false,
            )), flex: 1)
          ],
        ),
      ),
    );
  }
}
