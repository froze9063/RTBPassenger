import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/my_tickets/views/tabs/completed_tab.dart';
import 'package:ridethebee/app/modules/my_tickets/views/tabs/upcoming_tab.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';

import '../controllers/my_tickets_controller.dart';

class MyTicketsView extends GetView<MyTicketsController> {

  MyTicketsController _myTicketsController = Get.put(MyTicketsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color.fromRGBO(234, 237, 241, 1.0)
                )
            ),
            child: GetBuilder<MyTicketsController>(
              id: "tab_bar",
              init: MyTicketsController(),
              builder: (value) => Column(
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
                          Get.to(() => MenusView());
                        },
                      ),
                      Expanded(child: SizedBox(),flex: 1),
                      Text("My Tickets", style: TextStyle(
                          color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
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
                          Get.to(() => NotificationView());
                        },
                      ),
                      SizedBox(width: 10),
                    ],
                  ),

                  SizedBox(height: 24),

                  TabBar(
                    controller: _myTicketsController.tabController,
                    unselectedLabelColor: Color.fromRGBO(63, 61, 86, 1.0),
                    unselectedLabelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "PoppinsMedium"
                    ),
                    labelColor: Color.fromRGBO(255, 205, 56, 1.0),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "PoppinsBold"
                    ),
                    indicatorColor: Color.fromRGBO(255, 205, 56, 1.0),
                    indicatorWeight: 3.0,
                    tabs: <Widget>[
                      new Tab(text: "Upcoming"),
                      new Tab(text: "Completed"),
                    ],
                  )
                ],
              ),
            ),
          ),

          Expanded(child: TabBarView(
            controller: _myTicketsController.tabController,
            children: [
              UpcomingView(this._myTicketsController),
              CompletedView(this._myTicketsController),
            ],
          ),flex: 1)
        ],
      ),
    );
  }
}
