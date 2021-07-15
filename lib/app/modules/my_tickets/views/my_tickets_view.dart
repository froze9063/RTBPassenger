import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/my_tickets/views/tabs/completed_tab.dart';
import 'package:ridethebee/app/modules/my_tickets/views/tabs/upcoming_tab.dart';

import '../controllers/my_tickets_controller.dart';

class MyTicketsView extends GetView<MyTicketsController> {

  MyTicketsController _myTicketsController = Get.put(MyTicketsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(234, 237, 241, 1.0)
                    )
                ),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      GestureDetector(
                        child: Image.asset("assets/ic_menu.png", height: 28, width: 28),
                        onTap: (){

                        },
                      ),
                      Expanded(child: SizedBox(),flex: 1),
                      Text("My Tickets", style: TextStyle(
                          color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                          fontFamily: "PoppinsBold"
                      )),
                      Expanded(child: SizedBox(),flex: 1),
                      Image.asset("assets/ic_notification.png", height: 28, width: 28),
                      SizedBox(width: 24),
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

            Expanded(child: TabBarView(
              controller: _myTicketsController.tabController,
              children: [
                UpcomingView(this._myTicketsController),
                CompletedView(this._myTicketsController),
              ],
            ),flex: 1)
          ],
        ),
      ),
    );
  }
}
