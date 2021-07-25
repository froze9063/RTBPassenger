import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/thank_you/views/thank_you_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
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
              height: 305,
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
                            SizedBox(height: 36),
                            Row(
                              children: [
                                SizedBox(width: 49),

                                Expanded(child: SizedBox(),flex: 1),

                                Text("Feedback", style: TextStyle(
                                    color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 18,
                                    fontFamily: "PoppinsBold"
                                )),

                                Expanded(child: SizedBox(),flex: 1),

                                GestureDetector(
                                  child: Image.asset("assets/ic_close_black.png", height: 28, width: 28),
                                  onTap: (){
                                    Get.offAll(() => HomeView());
                                  },
                                ),

                                SizedBox(width: 24),
                              ],
                            ),

                            SizedBox(height: 24),

                            Image.asset("assets/img_driver_home.png", width: 100, height: 100),

                            SizedBox(height: 24),

                            Text("John Travis Scott Travolta", style: TextStyle(
                                color: Color.fromRGBO(35, 35, 35, 1.0), fontSize: 20,
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
                                    color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 15,
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
                  border: Border.all(
                      color: Color.fromRGBO(234, 237, 241, 1.0)
                  )
              ),
            ),

            SizedBox(height: 36),

            Row(
              children: [
                SizedBox(width: 48),
                Text("Driver Rating", style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(135, 141, 156, 1.0),
                    fontFamily: "PoppinsRegular"
                ))
              ],
            ),

            SizedBox(height: 16),

            Row(
              children: [
                SizedBox(width: 48),
                Expanded(child: Image.asset("assets/ic_yellow_star.png", width: 36, height: 36)),
                Expanded(child: Image.asset("assets/ic_yellow_star.png", width: 36, height: 36)),
                Expanded(child: Image.asset("assets/ic_yellow_star.png", width: 36, height: 36)),
                Expanded(child: Image.asset("assets/ic_yellow_star.png", width: 36, height: 36)),
                Expanded(child: Image.asset("assets/ic_yellow_star.png", width: 36, height: 36)),
                SizedBox(width: 48)
              ],
            ),

            SizedBox(height: 36),

            Row(
              children: [
                SizedBox(width: 48),
                Text("Feedback", style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(135, 141, 156, 1.0),
                    fontFamily: "PoppinsRegular"
                ))
              ],
            ),

            Expanded(child: Container(
              margin: EdgeInsets.only(left: 36,right: 36,bottom: 36,top: 16),
              width: double.maxFinite,
              height: double.maxFinite,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Thank you for the smooth journey! Will def use ride the bee again on my next trip.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(63, 61, 86, 1.0),
                      height: 1.5,
                      fontFamily: "PoppinsRegular"
                    ),
                  ),
                ),
              ),
            ), flex: 1),

            Padding(padding: EdgeInsets.only(bottom: 24, left: 24, right: 24), child: GestureDetector(
              child: ColoredButton(height: 45, width: double.maxFinite, title: "Submit",
                  color: Color.fromRGBO(255, 205, 56, 1.0)),
              onTap: (){
                Get.to(() => ThankYouView());
              },
            ))
          ],
        ),
      ),
    );
  }
}
