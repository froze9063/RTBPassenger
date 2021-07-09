import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: ListView.builder(itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(top: index == 0 ? 155 : 16, bottom: index == 7 ? 100 : 0),
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
                                Image.asset("assets/ic_three_dots.png",height: 6,width: 20)
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
                ), flex: 1)
              ],
            ),

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
                      child: Image.asset("assets/ic_menu.png", height: 28, width: 28),
                      onTap: (){
                        Get.to(MenusView());
                      },
                    ),

                    Expanded(child: SizedBox(),flex: 1),

                    Text("Notifications", style: TextStyle(
                        color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),

                    Expanded(child: SizedBox(),flex: 1),

                    Image.asset("assets/ic_yellow_notification.png", height: 28, width: 28),

                    SizedBox(width: 24),
                  ],
                ),
              ),
            ),

            Positioned.fill(child: Align(
              child: GestureDetector(
                child: Container(
                  width: double.maxFinite,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 205, 56, 1.0),
                      border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(220, 220, 220, 1.0)
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                          topRight: Radius.circular(25))
                  ),
                  child: Center(
                    child: Text("Back", style: TextStyle(
                        color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                        fontWeight: FontWeight.w500
                    )),
                  ),
                ),
                onTap: (){
                  Get.back();
                },
              ),
              alignment: Alignment.bottomCenter,
            ),
            ),

          ],
        ),
      ),
    );
  }
}
