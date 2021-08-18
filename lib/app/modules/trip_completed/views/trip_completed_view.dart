import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/review/views/review_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/trip_completed_controller.dart';

class TripCompletedView extends GetView<TripCompletedController> {

  TripCompletedController _tripCompletedController = Get.put(TripCompletedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
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
                    "Trip Completed", 
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
                    Get.offAll(() => HomeView());
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 75),
            Text("Thank You!", style: TextStyle(
                color: Color.fromRGBO(255, 205, 56, 1.0),
                fontSize: 25,
                fontFamily: "PoppinsBold"
            )),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 24),
                Expanded(child:  Text("Thank you for choosing Ride The Bee! We hope you had a smooth journey with us and would love to have you onboard again in the future!",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       color: Color.fromRGBO(135, 141, 156, 1.0),
                       height: 1.5,
                       fontSize: 16,
                       fontFamily: "PoppinsRegular"
                   )), flex: 1),
                SizedBox(width: 24),
              ],
            ),
            SizedBox(height: 36),
            Text(
                "Would you like to review your ride?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(63, 61, 86, 1.0),
                    fontFamily: "PoppinsMedium"
                )),
            Padding(padding: EdgeInsets.only(top: 36, left: 24, right: 24), child: GestureDetector(
              child: ColoredButton(height: 45, width: double.maxFinite, title: "Write Review",
                  color: Color.fromRGBO(255, 205, 56, 1.0)),
              onTap: (){
                Get.to(() => ReviewView(), arguments: {"trip_id" : _tripCompletedController.tripId});
              },
            )),
            Expanded(child: SizedBox(), flex: 1),
            Image.asset("assets/img_completed.png", width: double.maxFinite, fit: BoxFit.fill)
          ],
        ),
      ),
    );
  }
}
