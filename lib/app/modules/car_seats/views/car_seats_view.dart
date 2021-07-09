import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';

import '../controllers/car_seats_controller.dart';

class CarSeatsView extends GetView<CarSeatsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 165, left: 42, right: 42),
              width: double.maxFinite,
              height: 535,
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

                    Text("Select Seats", style: TextStyle(
                        color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),

                    Expanded(child: SizedBox(),flex: 1),

                    Image.asset("assets/ic_notification.png", height: 28, width: 28),

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
